from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from config import DATABASE_URI

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Define a sample model (table)
class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(50), nullable=False)

# Initialize the database
with app.app_context():
    db.create_all()

# Route to fetch all users
@app.route('/users', methods=['GET'])
def get_users():
    users = User.query.all()
    user_list = [{"id": user.id, "name": user.name, "email": user.email} for user in users]
    return jsonify(user_list)

# Route to add a new user
@app.route('/users', methods=['POST'])
def add_user():
    data = request.json
    new_user = User(name=data['name'], email=data['email'])
    db.session.add(new_user)
    db.session.commit()
    return jsonify({"message": "User added successfully"}), 201

# Route to update a user by id
@app.route('/users/<int:id>', methods=['PUT'])
def update_user(id):
    data = request.json
    user = User.query.get_or_404(id)
    user.name = data.get('name', user.name)
    user.email = data.get('email', user.email)
    db.session.commit()
    return jsonify({"message": "User updated successfully"})

# Route to delete a user by id
@app.route('/users/<int:id>', methods=['DELETE'])
def delete_user(id):
    user = User.query.get_or_404(id)
    db.session.delete(user)
    db.session.commit()
    return jsonify({"message": "User deleted successfully"})

# Route to fetch a single user by ID using a stored procedure
@app.route('/users/procedure/<int:id>', methods=['GET'])
def get_user_by_procedure(id):
    try:
        # Call the stored procedure
        result = db.session.execute("CALL GetUserById(:userId)", {"userId": id})
        user = result.fetchone()  # Fetch the single result
        if user:
            user_data = {"id": user.id, "name": user.name, "email": user.email}
            return jsonify(user_data)
        else:
            return jsonify({"message": "User not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)