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
            password=os.getenv('DB_PASSWORD'),
            port=int(os.getenv('DB_PORT', 3306))
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
        print("Error: Could not get database connection")
        return []
    
    try:
        cursor = connection.cursor(dictionary=True)
        cursor.execute(query, params)
        results = cursor.fetchall()
        return results
    except Error as e:
        print(f"Error executing query: {e}")
        print(f"Query: {query}")
        print(f"Params: {params}")
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
    
    query = f"SELECT * FROM {search_type} WHERE name LIKE %s"
    results = execute_query(query, (f"%{search_term}%",))
    return jsonify(results)

@app.route('/api/label', methods=['GET'])
def search_labels():
    search_term = request.args.get('term')
    try:
        query = "CALL SearchLabels(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in search_labels: {e}")
        return jsonify({"error": str(e)}), 500
    
@app.route('/api/album', methods=['GET'])
def search_albums():
    search_term = request.args.get('term')
    try:
        query = "CALL SearchAlbums(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in search_albums: {e}")
        return jsonify({"error": str(e)}), 500
    
@app.route('/api/song', methods=['GET'])
def search_songs():
    search_term = request.args.get('term')
    try:
        query = "CALL SearchSongs(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    
    except Error as e:
        print(f"Error in search_songs: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/api/artist', methods=['GET'])
def search_artists():
    search_term = request.args.get('term')
    try:
        query = "CALL SearchArtists(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in search_artists: {e}")
        return jsonify({"error": str(e)}), 500
@app.route('/api/featured-awards', methods=['GET'])
def get_featured_awards():
    query = "SELECT * FROM artistswithaward"
    results = execute_query(query)
    return jsonify(results)

@app.route('/api/featured-artists-by-country', methods=['GET'])
def get_featured_artists_by_country():
    query = "SELECT * FROM artistsinregion"
    results = execute_query(query)
    return jsonify(results)

@app.route('/api/stats', methods=['GET'])
def get_stats():
    stats = {
        'songs': execute_query("SELECT COUNT(*) as count FROM song")[0]['count'],
        'artists': execute_query("SELECT COUNT(*) as count FROM artist")[0]['count'],
        'albums': execute_query("SELECT COUNT(*) as count FROM album")[0]['count']
    }
    return jsonify(stats)

@app.route('/api/collaborations', methods=['GET'])
def get_collaborations():
    search_term = request.args.get('term')
    try:
        query = "CALL GetArtistCollaborationsByName(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in search_artists: {e}")
        return jsonify({"error": str(e)}), 500
    

@app.route('/api/awards', methods=['GET'])
def get_awards():
    search_term = request.args.get('term')
    try:
        query = "CALL GetArtistAwardsByName(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in get_awards: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/api/top-streamed', methods=['GET'])
def get_top_streamed():
    search_term = request.args.get('term')
    try:
        query = "CALL artistTopStreamedSongs(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in get_top_streamed: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/api/active-members', methods=['GET'])
def get_active_members():
    search_term = request.args.get('term')
    try:
        query = "CALL ArtistActiveMembers(%s)"
        results = execute_query(query, (search_term,))
        print("API Response:", results)
        return jsonify(results)
    except Error as e:
        print(f"Error in get_active_members: {e}")
        return jsonify({"error": str(e)}), 500

@app.route('/api/top-labels', methods=['GET'])
def get_top_labels():
    query = "CALL GetTop3ActiveLabels()"
    
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

@app.route('/api/insert', methods=['POST'])
def insert_data():
    data = request.json
    table = data.get('table')
    fields = data.get('fields')
    
    if not table or not fields:
        return jsonify({"error": "Missing table or fields"}), 400
    
    connection = get_db_connection()
    if connection is None:
        return jsonify({"error": "Database connection failed"}), 500

    try:
        cursor = connection.cursor()
        
        columns = ', '.join(fields.keys())
        placeholders = ', '.join(['%s'] * len(fields))
        values = tuple(fields.values())
        
        query = f"INSERT INTO {table} ({columns}) VALUES ({placeholders})"
        
        cursor.execute(query, values)
        connection.commit()
        
        inserted_id = cursor.lastrowid
        
        return jsonify({"message": "Data inserted successfully", "id": inserted_id}), 201
    
    except Error as e:
        return jsonify({"error": str(e)}), 500
    
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.getenv('DB_PORT', 5000)))