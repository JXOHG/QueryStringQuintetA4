from flask import Flask, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
import os
import mysql.connector
from mysql.connector import Error

load_dotenv()  # Load environment variables from .env file

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Database connection
def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host=os.getenv('DB_HOST'),
            database=os.getenv('DB_NAME'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD')
        )
        if connection.is_connected():
            return connection
    except Error as e:
        print(f"Error connecting to MySQL database: {e}")
        return None

# Helper function for executing SQL queries
def execute_query(query, params=()):
    connection = get_db_connection()
    if connection is None:
        return []
    
    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute(query, params)
        results = cursor.fetchall()
        return results
    except Error as e:
        print(f"Error executing query: {e}")
        return []
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

# Routes
@app.route('/api/search', methods=['GET'])
def search():
    search_type = request.args.get('type')
    search_term = request.args.get('term')
    
    # Placeholder query - replace with actual SQL function calls
    query = f"SELECT * FROM {search_type}s WHERE name LIKE %s"
    results = execute_query(query, (f"%{search_term}%",))
    return jsonify(results)

@app.route('/api/collaborations', methods=['GET'])
def get_collaborations():
    artist = request.args.get('artist')
    query = """
    SELECT DISTINCT a2.name AS collaborator, s.title AS song
    FROM artists a1
    JOIN song_artists sa1 ON a1.id = sa1.artist_id
    JOIN songs s ON sa1.song_id = s.id
    JOIN song_artists sa2 ON s.id = sa2.song_id
    JOIN artists a2 ON sa2.artist_id = a2.id
    WHERE a1.name = %s AND a2.name != %s
    """
    results = execute_query(query, (artist, artist))
    return jsonify(results)

@app.route('/api/awards', methods=['GET'])
def get_awards():
    artist = request.args.get('artist')
    query = """
    SELECT aw.name AS award, aw.year
    FROM artists a
    JOIN artist_awards aa ON a.id = aa.artist_id
    JOIN awards aw ON aa.award_id = aw.id
    WHERE a.name = %s
    ORDER BY aw.year DESC
    """
    results = execute_query(query, (artist,))
    return jsonify(results)

@app.route('/api/top-streamed', methods=['GET'])
def get_top_streamed():
    artist = request.args.get('artist')
    query = """
    SELECT s.title, s.stream_count
    FROM songs s
    JOIN song_artists sa ON s.id = sa.song_id
    JOIN artists a ON sa.artist_id = a.id
    WHERE a.name = %s
    ORDER BY s.stream_count DESC
    LIMIT 5
    """
    results = execute_query(query, (artist,))
    return jsonify(results)

@app.route('/api/companies-net-worth', methods=['GET'])
def get_companies_net_worth():
    region = request.args.get('region')
    query = """
    SELECT SUM(net_worth) AS total_net_worth
    FROM companies
    WHERE region = %s
    """
    results = execute_query(query, (region,))
    return jsonify(results[0] if results else {"total_net_worth": 0})

@app.route('/api/active-members', methods=['GET'])
def get_active_members():
    artist = request.args.get('artist')
    query = """
    SELECT m.name, m.role
    FROM artists a
    JOIN artist_members am ON a.id = am.artist_id
    JOIN members m ON am.member_id = m.id
    WHERE a.name = %s AND am.is_active = 1
    """
    results = execute_query(query, (artist,))
    return jsonify(results)

@app.route('/api/top-labels', methods=['GET'])
def get_top_labels():
    query = """
    SELECT l.name, COUNT(DISTINCT a.id) AS active_artists
    FROM labels l
    JOIN artists a ON l.id = a.label_id
    WHERE a.is_active = 1
    GROUP BY l.id
    ORDER BY active_artists DESC
    LIMIT 3
    """
    results = execute_query(query)
    return jsonify(results)

@app.route('/api/artist-songs', methods=['GET'])
def get_artist_songs():
    query = """
    SELECT a.name, COUNT(DISTINCT s.id) AS total_songs
    FROM artists a
    JOIN song_artists sa ON a.id = sa.artist_id
    JOIN songs s ON sa.song_id = s.id
    GROUP BY a.id
    ORDER BY total_songs DESC
    """
    results = execute_query(query)
    return jsonify(results)

@app.route('/api/live-events', methods=['GET'])
def get_live_events():
    region = request.args.get('region')
    query = """
    SELECT e.name, e.date, v.name AS venue
    FROM events e
    JOIN venues v ON e.venue_id = v.id
    WHERE v.region = %s AND e.date >= CURDATE()
    ORDER BY e.date
    """
    results = execute_query(query, (region,))
    return jsonify(results)

@app.route('/api/producer-contributions', methods=['GET'])
def get_producer_contributions():
    producer = request.args.get('producer')
    genre = request.args.get('genre')
    query = """
    SELECT COUNT(DISTINCT s.id) AS total_songs,
           GROUP_CONCAT(DISTINCT a.name SEPARATOR ', ') AS notable_artists
    FROM producers p
    JOIN song_producers sp ON p.id = sp.producer_id
    JOIN songs s ON sp.song_id = s.id
    JOIN genres g ON s.genre_id = g.id
    JOIN song_artists sa ON s.id = sa.song_id
    JOIN artists a ON sa.artist_id = a.id
    WHERE p.name = %s AND g.name = %s
    """
    results = execute_query(query, (producer, genre))
    return jsonify(results[0] if results else {"total_songs": 0, "notable_artists": ""})

@app.route('/api/top-genres', methods=['GET'])
def get_top_genres():
    query = """
    SELECT g.name, COUNT(s.id) AS song_count
    FROM genres g
    JOIN songs s ON g.id = s.genre_id
    GROUP BY g.id
    ORDER BY song_count DESC
    LIMIT 10
    """
    results = execute_query(query)
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.getenv('PORT', 5000)))