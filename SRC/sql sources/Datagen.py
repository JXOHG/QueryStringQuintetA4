# Enter password
password = '5090'
# Genres
import mysql.connector

cnx = mysql.connector.connect(user='root', password=password,
                            host='localhost',
                            database='SongSelector')

# Create a cursor object to interact with the database
cursor = cnx.cursor()

# Create the Genre table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Genre (
        Name VARCHAR(60) UNIQUE NOT NULL,
        Description VARCHAR(1000),
        OriginDate DATE,
        PRIMARY KEY (Name)
    );
''')

# List of genres with dummy descriptions and origin dates
genres = [
    ("Hip-Hop/Rap", "A genre characterized by rhythmic, rhyming speech.", "1970-01-01"),
    ("Pop", "Popular music aimed at a wide audience.", "1950-01-01"),
    ("Electronic Dance Music (EDM)", "Music created for dance-based entertainment.", "1980-01-01"),
    ("Rock", "A genre characterized by a strong rhythm and often amplified instruments.", "1940-01-01"),
    ("Country", "Music originating from the rural southern United States.", "1920-01-01"),
    ("Latin Music", "Music that incorporates Latin American influences.", "1950-01-01"),
    ("K-Pop", "Korean pop music known for its colorful audiovisual elements.", "1990-01-01"),
    ("R&B", "A genre of popular music that originated in African American communities.", "1940-01-01"),
    ("Amapiano", "A South African genre blending house and jazz elements.", "2010-01-01"),
    ("Afrobeats", "A music genre that combines elements of West African music and American jazz.", "2010-01-01"),
    ("Jazz", "A music genre that originated in the African-American communities.", "1920-01-01"),
    ("Classical Music", "Art music produced in the traditions of Western culture.", "1600-01-01"),
    ("Indie/Alternative", "A genre encompassing various distinct styles outside the mainstream.", "1980-01-01"),
    ("Metal", "A genre characterized by loud, aggressive sounds.", "1960-01-01"),
    ("Folk", "Traditional music that originates in the cultural traditions of a community.", "1930-01-01"),
    ("Reggae", "Music genre with emphasis on rhythm and blues, originating from Jamaica.", "1960-01-01"),
    ("Blues", "A music genre characterized by its chord progressions and lyrics of melancholy.", "1910-01-01"),
    ("Soul", "A genre that combines elements of African-American gospel, R&B, and jazz.", "1950-01-01"),
    ("Synth-Pop", "A genre using synthesizers as the dominant musical instrument.", "1980-01-01"),
    ("New Wave", "A genre mixing punk rock with other styles like funk and electronic.", "1970-01-01"),
    ("Punk Rock", "A rock music genre that emerged in the mid-1970s.", "1975-01-01"),
    ("Disco", "A genre of dance music containing elements of funk, soul, and pop.", "1970-01-01"),
    ("Trap", "A genre known for its use of 808 kicks, hi-hats, and snares.", "1990-01-01"),
    ("House", "A genre of electronic dance music characterized by repetitive beats.", "1980-01-01"),
    ("Drum 'n' Bass", "An electronic music genre featuring fast breakbeats.", "1990-01-01"),
    ("Britpop", "A British alternative rock subgenre that emerged in the early 1990s.", "1990-01-01"),
    ("Shoegaze", "A subgenre of indie and alternative rock characterized by its ethereal sound.", "1980-01-01"),
    ("Dubstep", "A genre of electronic dance music with heavy bass and syncopated beats.", "1990-01-01"),
    ("Trap Metal", "A fusion genre that blends trap music with heavy metal elements.", "2015-01-01"),
    ("Gospel", "A genre of Christian music known for its vocal-driven sound.", "1920-01-01"),
    ("Dancehall", "A genre of Jamaican popular music that originated in the late 1970s.", "1970-01-01"),
    ("Ska", "A music genre that originated in Jamaica combining elements of Caribbean mento and calypso.", "1960-01-01"),
    ("Progressive Rock", "A subgenre of rock music with complex compositions.", "1960-01-01"),
    ("Grime", "A genre of electronic music that emerged in London in the early 2000s.", "2000-01-01"),
    ("Techno", "A form of electronic dance music that emerged in Detroit.", "1980-01-01"),
    ("Emo", "A genre of rock music characterized by emotional lyrics.", "1980-01-01"),
    ("Ballad", "A form of verse, often a narrative set to music.", "1500-01-01"),
    ("Salsa", "A genre that incorporates various Cuban musical styles.", "1960-01-01"),
    ("Ambient", "A genre of music that puts an emphasis on tone and atmosphere.", "1970-01-01"),
    ("Opera", "A form of theatre in which music is a fundamental component.", "1600-01-01"),
    ("Bluegrass", "A form of American roots music.", "1940-01-01"),
    ("Flamenco", "A style of Spanish music and dance.", "1800-01-01"),
    ("Heavy Metal", "A genre of rock music with intense tempos and aggressive sounds.", "1960-01-01"),
    ("Electro", "A genre of electronic music influenced by funk.", "1980-01-01"),
    ("Bossa Nova", "A genre of Brazilian music that fuses samba and jazz.", "1950-01-01"),
    ("Swing", "A form of jazz music developed in the United States.", "1930-01-01"),
    ("Tech House", "A subgenre of house music blending elements of techno.", "1990-01-01"),
    ("Motown", "A genre of R&B and soul music known for its polished production.", "1960-01-01"),
    ("Trance", "A genre of electronic dance music that develops melodic phrases.", "1990-01-01"),
    ("Post-Punk", "A genre that came out of the punk rock movement.", "1970-01-01"),
    ("Lo-fi", "A genre using low-fidelity recording practices.", "1990-01-01"),
    ("Chillwave", "A genre of music with relaxed, atmospheric melodies.", "2010-01-01"),
    ("Hardcore Punk", "A fast-paced subgenre of punk rock.", "1970-01-01"),
    ("Zydeco", "A music genre originating in Louisiana combining Cajun music with blues.", "1920-01-01"),
    ("Celtic", "A broad grouping of music originating from the Celtic people of Western Europe.", "1900-01-01"),
    ("Bachata", "A genre of Latin American music originating from the Dominican Republic.", "1960-01-01"),
    ("Samba", "A Brazilian music genre and dance style.", "1900-01-01"),
    ("J-Pop", "A genre of Japanese pop music.", "1990-01-01"),
    ("Musical Theatre", "A form of theatrical performance that combines songs, spoken dialogue, and dance.", "1800-01-01"),
    ("Chamber Music", "A form of classical music composed for a small group of instruments.", "1600-01-01")
]

# Insert genres into the Genre table
for genre in genres:
    cursor.execute('''
        INSERT INTO Genre (Name, Description, OriginDate) VALUES (%s, %s, %s)
    ''', genre)

# Commit the transaction
cnx.commit()

# Close the cursor and connection
cursor.close()
cnx.close()

print("The Genre table has been populated with the top 60 music genres.")

# Regions
import mysql.connector

# Connect to MySQL server
cnx = mysql.connector.connect(user='root', password=password,
                            host='localhost',
                            database='SongSelector')

# Create a cursor object to execute SQL commands
cursor = cnx.cursor()

# Create the 'Region' table
cursor.execute('''

CREATE TABLE IF NOT EXISTS Region (
    Country VARCHAR(60) UNIQUE NOT NULL,
    Language VARCHAR(30),
    PRIMARY KEY (Country)
);
''')

# List of countries and their respective first languages

regions = [
    ('Afghanistan', 'Pashto'),
    ('Albania', 'Albanian'),
    ('Algeria', 'Arabic'),
    ('Angola', 'Portuguese'),
    ('Antigua and Barbuda', 'English'),
    ('Argentina', 'Spanish'),
    ('Armenia', 'Armenian'),
    ('Australia', 'English'),
    ('Azerbaijan', 'Azerbaijani'),
    ('Bangladesh', 'Bengali'),
    ('Barbados', 'English'),
    ('Belarus', 'Belarusian'),
    ('Belgium', 'Dutch'),
    ('Bolivia', 'Castilian'),
    ('Bosnia and Herzegovina', 'Bosnian'),
    ('Botswana', 'English'),
    ('Brazil', 'Portuguese'),
    ('Brunei Darussalam', 'Malay'),
    ('Bulgaria', 'Bulgarian'),
    ('Burkina Faso', 'French'),
    ('Burundi', 'French'),
    ('Cabo Verde', 'Portuguese'),
    ('Cameroon', 'English'),
    ('Central African Republic', 'French'),
    ('Chad', 'Arabic'),
    ('Chile', 'Spanish'),
    ('China', 'Mandarin Chinese'),
    ('Colombia', 'Spanish'),
    ('Comoros', 'Arabic'),
    ('Costa Rica', 'Spanish'),
    ('Côte D’Ivoire', 'French'),
    ('Croatia', 'Croatian'),
    ('Cyprus', 'Greek'),
    ('Czech Republic', 'Czech'),
    ('Dem. People’s Republic of Korea', 'Korean'),
    ('Dem. Republic of the Congo', 'French'),
    ('Djibouti', 'Arabic'),
    ('Dominica', 'English'),
    ('Dominican Republic', 'Spanish'),
    ('Ecuador', 'Spanish'),
    ('El Salvador', 'Spanish'),
    ('Equatorial Guinea', 'French'),
    ('Eritrea', 'Tigrinya'),
    ('Estonia', 'Estonian'),
    ('Eswatini', 'English'),
    ('Ethiopia', 'Afar'),
    ('Fiji', 'English'),
    ('Finland', 'Finnish'),
    ('Gambia (Republic of The)', 'English'),
    ('Georgia', 'Georgian'),
    ('Guatemala', 'Spanish'),
    ('Guinea Bissau', 'Portuguese'),
    ('Haiti', 'French'),
    ('Honduras', 'Spanish'),
    ('Hungary', 'Hungarian'),
    ('Iceland', 'Icelandic'),
    ('India', 'Hindi'),
    ('Indonesia', 'Indonesian'),
    ('Iran (Islamic Republic of)', 'Persian'),
    ('Ireland', 'English'),
    ('Kazakhstan', 'Kazakh'),
    ('Kiribati', 'English'),
    ('Kuwait', 'Standard Arabic'),
    ('Kyrgyzstan', 'Kyrgyz'),
    ('Lao People’s Dem. Republic', 'Lao'),
    ('Lesotho', 'Sotho'),
    ('Liechtenstein', 'German'),
    ('Lithuania', 'Lithuanian'),
    ('Luxembourg', 'French'),
    ('Madagascar', 'French'),
    ('Malawi', 'English'),
    ('Malaysia', 'Malay'),
    ('Maldives', 'Dhivehi'),
    ('Malta', 'Maltese'),
    ('Marshall Islands', 'English'),
    ('Mauritania', 'Arabic'),
    ('Mauritius', 'English'),
    ('Mexico', 'Spanish'),
    ('Micronesia (Federated States of)', 'Woleaian'),
    ('Mongolia', 'Mongolian'),
    ('Montenegro', 'Albanian'),
    ('Morocco', 'Arabic'),
    ('Mozambique', 'Portuguese'),
    ('Nauru', 'English'),
    ('Netherlands', 'Dutch'),
    ('New Zealand', 'English'),
    ('Nicaragua', 'Spanish'),
    ('North Macedonia', 'Macedonian'),
    ('Norway', 'Norwegian'),
    ('Pakistan', 'English'),
    ('Palau', 'English'),
    ('Papua New Guinea', 'English'),
    ('Paraguay', 'Spanish'),
    ('Peru', 'Spanish'),
    ('Philippines', 'English'),
    ('Portugal', 'Portuguese'),
    ('Republic of Korea', 'Korean'),
    ('Republic of Moldova', 'Romanian'),
    ('Romania', 'Romanian'),
    ('Russian Federation', 'Russian'),
    ('Rwanda', 'English'),
    ('Saint Kitts and Nevis', 'English'),
    ('Saint Lucia', 'English'),
    ('Saint Vincent and the Grenadines', 'English'),
    ('San Marino', 'Italian'),
    ('Sao Tome and Principe', 'Portuguese'),
    ('Saudi Arabia', 'Arabic'),
    ('Seychelles', 'English'),
    ('Sierra Leone', 'English'),
    ('Singapore', 'English'),
    ('Slovenia', 'Slovene'),
    ('Solomon Islands', 'English'),
    ('South Africa', 'Afrikaans'),
    ('South Sudan', 'English'),
    ('Sri Lanka', 'Sinhala'),
    ('Sudan', 'Arabic'),
    ('Switzerland', 'French'),
    ('Syrian Arab Republic', 'Arabic'),
    ('Tajikistan', 'Tajik'),
    ('Timor-Leste', 'Portuguese'),
    ('Tonga', 'English'),
    ('Trinidad and Tobago', 'English'),
    ('Tunisia', 'Tunisian'),
    ('Turkmenistan', 'Turkmen'),
    ('Tuvalu', 'English'),
    ('Uganda', 'English'),
    ('Ukraine', 'Ukrainian'),
    ('United Arab Emirates', 'Arabic'),
    ('United Kingdom', 'English'),
    ('United Republic of Tanzania', 'English'),
    ('United States of America', 'English'),
    ('Uruguay', 'Spanish'),
    ('Uzbekistan', 'Uzbek'),
    ('Vanuatu', 'English'),
    ('Venezuela', 'Spanish'),
    ('Viet Nam', 'Vietnamese'),
    ('Zimbabwe', 'Chewa'),
]

# Insert data into the 'Region' table
for region in regions:
    cursor.execute('''

INSERT INTO Region (Country, Language) VALUES (%s, %s)
''', region)

# Commit the changes and close the connection
cnx.commit()
cursor.close()
cnx.close()

print("Database created and populated with regions data.")
# Company
import random
import mysql.connector

cnx = mysql.connector.connect(user='root', password=password,
                            host='localhost',
                            database='SongSelector')

# Create a cursor object to interact with the database
cursor = cnx.cursor()

# Define prefixes and suffixes for company names
prefixes = [
    "Tech", "Green", "Global", "Net", "Info", "Prime",
    "Future", "Pioneer", "Elite", "Pro", "Innovative", "Apex",
    "Vision", "Quantum", "Dynamic", "Next", "Rapid", "Vertex",
    "Smart", "Eco", "Blue", "Red", "White", "Black",
    "Gen", "Sun", "Moon", "Star", "Galaxy", "Terra",
    "Energy", "Alpha", "Beta", "Gamma", "Delta", "Omni",
    "Hyper", "Nano", "Macro", "Micro", "Wave", "Turbo",
    "Mega", "Ultra", "Cyber", "Digital", "Techno", "Cloud",
    "Planet", "Sphere", "Vortex", "Volt", "Brilliant", "Infinity"

]

suffixes = [
    "Systems", "Solutions", "Services", "Corp", "Enterprises", "Industries",
    "Group", "Holdings", "Partners", "Associates", "Ventures", "Consulting",
    "Limited", "Incorporated", "Technologies", "Network", "Dynamics", "Innovations",
    "Analytics", "Development", "Software", "Hardware", "Capital", "Marketing",
    "Designs", "Productions", "Creations", "Concepts", "Foundry", "Engineering",
    "Fabrics", "Laboratories", "Spark", "Interface", "Access", "Strategy",
    "Energy", "Arena", "Collaborations", "Horizons", "Projects", "Frontier",
    "Valley", "Hub", "Depot", "Space", "Node", "Works",
    "Matrix", "Links", "Bridge", "Circuit", "Impulse", "Wave"

]

# Generate company names by combining prefixes and suffixes
company_names = set()
for prefix in prefixes:
    for suffix in suffixes:
        company_names.add(f"{prefix} {suffix}")

company_names = list(company_names)[:360]

# Database connection configuration
cursor = cnx.cursor()

# Preparing the data to insert
companies_data = []

for name in company_names:
    number_of_employees = random.randint(50, 1000)  # Random number of employees
    net_worth = round(random.uniform(100000.00, 1000000.00), 2)  # Random net worth
    companies_data.append((name, number_of_employees, net_worth))

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO Company (Name, NumberOfEmployees, NetWorth)
VALUES (%s, %s, %s)
"""

# Execute the SQL INSERT statements
cursor.executemany(insert_statement, companies_data)

# Commit the transaction
cnx.commit()

# Close the cursor and the connection
cursor.close()
cnx.close()

print("Table has been populated with 300 records.")

# Label
import random
import mysql.connector

cnx = mysql.connector.connect(user='root', password=password,
                            host='localhost',
                            database='SongSelector')

cursor = cnx.cursor()

# Retrieve company names from the Company table
cursor.execute("SELECT Name FROM Company")

company_names = cursor.fetchall()

# Prepare data for inserting into the Label table
labels_data = []

for company in company_names:
    company_name = company[0]  # Since fetchall returns tuples
    label_name = f"Label_{company_name}"
    label_type = f"Type{random.randint(1, 18)}"  # Random type from Type1 to Type18
    labels_data.append((label_name, company_name, label_type))

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO Label (LabelName, CompanyName, Type)
VALUES (%s, %s, %s)
"""

# Execute the SQL INSERT statements for the labels
cursor.executemany(insert_statement, labels_data[:360])  # Insert 360 labels

# Commit the transaction
cnx.commit()

# Close the cursor and the connection
cursor.close()
cnx.close()

print("Label table has been populated with 360 records.")

# Producer
import random
import mysql.connector
from mysql.connector import Error

# MySQL database connection configuration
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except Error as e:
    print(f"Error: {e}")
    exit(1)

# Retrieve LabelID's from the Label table
try:
    cursor.execute("SELECT LabelID FROM Label")
    label_ids = cursor.fetchall()
    
    # Flatten the list of tuples to a single list of Label IDs
    label_ids = [label_id[0] for label_id in label_ids]

    # Ensure there are enough labels to match with producers
    if len(label_ids) < 256:
        print(f"Warning: Only {len(label_ids)} LabelIDs found, but 256 producers are being generated.")
except Error as e:
    print(f"Error fetching label IDs: {e}")
    cursor.close()
    cnx.close()
    exit(1)

# Lists of distinct first names and last names
first_names = [
    "Ethan", "Isabella", "Lucas", "Mia", "Jackson", "Ava",
    "Aiden", "Sophia", "Caleb", "Chloe", "Noah", "Amelia",
    "Logan", "Scarlett", "Mason", "Grace"
]

last_names = [
    "Smith", "Jones", "Brown", "Williams", "Taylor", "Davies",
    "Evans", "Thomas", "Johnson", "Roberts", "Walker", "Wright",
    "Thompson", "White", "Harris", "Martin"
]

# Generate lists of unique producer names and alias names
producer_names = [f"{fn} {ln}" for fn in first_names for ln in last_names][:256]

prefixes = [
    "Beat", "Echo", "Nova", "Rhythm", "Vibe", "Sonic",
    "Wave", "Pulse", "Fusion", "Zen", "Flux", "Horizon",
    "Tempo", "Echoes", "Mirage", "Prism"
]

suffixes = [
    "Beats", "Mix", "Sound", "Tracks", "Grooves", "Vibes",
    "Rhythm", "Sessions", "Frequencies", "Tones", "Wave", "Records",
    "Productions", "Masters", "Studios", "Collective"
]

alias_names = [f"{p} {s}" for p in prefixes for s in suffixes][:256]

# Generate producers' data
producers_data = []
for i in range(256):
    first_name, last_name = producer_names[i].split()  # Split full name
    alias = alias_names[i]
    associated_label_id = random.choice(label_ids)  # Randomly assign a LabelID
    creation_year = random.randint(1990, 2024)  # Random creation year
    net_worth = round(random.uniform(100000, 1000000), 2)  # Random net worth
    number_of_artists = random.randint(1, 10)  # Random number of artists

    # Append the tuple of producer data to the list
    producers_data.append((first_name, last_name, alias, associated_label_id,
                            creation_year, net_worth, number_of_artists))

# Debugging: Print some of the data to verify
for entry in producers_data[:5]:  # Only print the first 5 for brevity
    print(entry)

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO Producer (FirstName, LastName, Alias, AssociatedLabel, Creation, NetWorth, NumberOfArtists)
VALUES (%s, %s, %s, %s, %s, %s, %s)
"""

# Execute the SQL INSERT statements for the producers
try:
    cursor.executemany(insert_statement, producers_data)
    # Commit the transaction
    cnx.commit()
    print("Producer table has been populated with 256 records.")
except Error as e:
    print(f"Error during insert: {e}")
    cnx.rollback()  # Rollback in case of error

# Close the cursor and the connection
cursor.close()
cnx.close()



# Artist
import random
import mysql.connector
from mysql.connector import Error
from datetime import datetime

# MySQL database connection configuration
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except Error as e:
    print(f"Error: {e}")
    exit(1)

# Retrieve unique country names from the Region table
cursor.execute("SELECT DISTINCT Country FROM Region")
regions = [region[0] for region in cursor.fetchall()]

# Retrieve label IDs from the Label table
cursor.execute("SELECT LabelID FROM Label")
label_ids = [label[0] for label in cursor.fetchall()]

# Define prefixes and suffixes for artist names
prefixes = [
    "Whimsical", "Daring", "Sublime", "Ethereal", "Radiant", "Infinite",
    "Mystic", "Vivid", "Celestial", "Echoing", "Aesthetic", "Visionary",
    "Zenith", "Majestic", "Harmonic", "Noble", "Luminous", "Enchanted",
    "Brilliant", "Captivating", "Dynamic", "Epic", "Fantasia", "Galactic",
    "Heroic", "Illustrious", "Jubilant", "Kinetic", "Lyrical", "Mythic",
    "Nirvana", "Opulent", "Pristine", "Quixotic", "Radiant", "Serene",
    "Tranquil", "Uplifting", "Vibrant", "Wonderous"
]

suffixes = [
    "Wanderers", "Dreamers", "Virtuosos", "Symphony", "Overture", "Crescendo",
    "Harmonics", "Sonata", "Ensemble", "Resonance", "Echoes", "Fantasies",
    "Journeys", "Odyssey", "Sagas", "Epic", "Legends", "Chronicles",
    "Memories", "Tales", "Rhapsody", "Anthems", "Serenades", "Ballads",
    "Chorales", "Harmonies", "Melodies", "Cadence", "Prelude", "Opus",
    "Psalms", "Hymns", "Arias", "Vignettes", "Anecdotes", "Reflections",
    "Moments", "Impressions", "Eclipses", "Palettes"
]

# Generate artist names by combining prefixes and suffixes
artist_names = [f"{prefix} {suffix}" for prefix in prefixes for suffix in suffixes]

# Prepare data for inserting into the Artist table
artists_data = []
current_year = datetime.now().year

# Define the target total number of members
desired_total_members = 4900
artists_count = 1600  # Number of artists

# Allow a percentage of artists to be single-member artists
solo_artist_percentage = 0.20  # 20% solo artists

# Calculate the number of solo artists
solo_artist_count = int(artists_count * solo_artist_percentage)

# Calculate the total members assigned to solo artists
solo_artists_members = solo_artist_count  # Each solo artist has exactly 1 member

# Calculate the remaining artists and their target total members
remaining_artists = artists_count - solo_artist_count
remaining_members = desired_total_members - solo_artists_members  # Subtract the solo artist members

# Now distribute the remaining members among the other artists (max 6 members per artist)
remaining_members_per_artist = remaining_members // remaining_artists  # Minimum members per artist
extra_members = remaining_members - (remaining_members_per_artist * remaining_artists)  # Remainder to distribute

# Now we create the artist data
for i in range(artists_count):
    name = artist_names[i % len(artist_names)]  # Cycle through artist names
    creation_year = random.randint(1990, 2024)
    end_year = random.choice([random.randint(creation_year, 2024) if random.random() > 0.5 else None])
    years_active = (end_year if end_year else current_year) - creation_year

    # Assign number of members to solo artists (1 member)
    if i < solo_artist_count:
        number_of_members = 1
    else:
        # Assign number of members to non-solo artists
        number_of_members = remaining_members_per_artist
        if extra_members > 0:
            number_of_members += 1
            extra_members -= 1

    # Ensure the number of members does not exceed 6
    number_of_members = min(number_of_members, 6)

    monthly_listeners = random.randint(1000, 100000000)
    from_region = random.choice(regions)
    label_id = random.choice(label_ids)

    artists_data.append((name, creation_year, end_year, years_active, number_of_members, 
                         monthly_listeners, from_region, label_id))

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO Artist (Name, CreationYear, EndYear, YearsActive, NumberOfMembers, MonthlyListeners, FromRegion, LabelID)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
"""

# Execute the SQL INSERT statements for the artists
cursor.executemany(insert_statement, artists_data)

# Commit the transaction
cnx.commit()

# Close the cursor and the connection
cursor.close()
cnx.close()

# Output the result
print("Artist table has been populated with 1600 records.")
# Album
import random
import mysql.connector
from mysql.connector import Error
from datetime import datetime, timedelta

# MySQL database connection configuration
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except Error as e:
    print(f"Error: {e}")
    exit(1)

# Retrieve SpotifyID values from the Artist table
cursor.execute("SELECT SpotifyID FROM Artist")
artist_ids = [artist[0] for artist in cursor.fetchall()]

# Define prefixes and suffixes for album names
prefixes = [
    "Echoing", "Celestial", "Distant", "Luminous", "Whispers of", "Dreamscape",
    "Frozen", "Enchanted", "Radiant", "Timeless", "Cosmic", "Velvet",
    "Melancholy", "Ethereal", "Wandering", "Shattered", "Harmonic", "Midnight",
    "Hidden", "Serene", "Electric", "Vibrant", "Infinite", "Glistening",
    "Mystical", "Journey Through", "Chasing", "Revived", "Solitary", "Awakening",
    "Sacred", "Transcendent", "Fragments of", "Elysian", "Prismatic", "Sonic",
    "Uplifting", "Kaleidoscopic", "Reflective", "Faded", "Signals from",
    "Ancient", "Glimmering", "Radiance of", "Lost in", "Wildflower", "Twilight",
    "Emerging", "Shimmering", "Boundless"
]

suffixes = [
    "Chronicles", "Odyssey", "Echoes", "Visions", "Reverie", "Journey",
    "Manifesto", "Dreamscapes", "Fragments", "Legacies", "Infinities", "Tides",
    "Inner Sanctum", "Horizons", "Whispers", "Anecdotes", "Transcendence", 
    "Collage", "Mosaics", "Paradox", "Timelines", "Reflections", 
    "Eclipses", "Echo Chamber", "Vignettes", "Sagas", "Epiphanies", "Spheres", 
    "Allure", "Serenades", "Vistas", "Phantoms", "Traces", "Tapestries", 
    "Nocturnes", "Stardust", "Recollections", "Revolution", 
    "Embarkation", "Unfolding", "Resonance", "Pulse", "Tales", "Mementos", 
    "Ascension", "Labyrinth", "Elysium", "Reflections"
]

# Generate album names by combining prefixes and suffixes
album_names = [f"{prefix} {suffix}" for prefix in prefixes for suffix in suffixes]

# Generate unique release dates
start_date = datetime(1990, 1, 1)
end_date = datetime(2023, 12, 31)
total_days = (end_date - start_date).days
release_dates = set()

while len(release_dates) < 2500:
    random_days = random.randint(0, total_days)
    new_release_date = start_date + timedelta(days=random_days)
    release_dates.add(new_release_date)

sorted_release_dates = sorted(release_dates)

# Calculate the desired total number of songs
desired_total_songs = 6400
albums_count = 2500

# Generate random number of songs for each album, ensuring 10% have 1 song
albums_data = []
one_song_albums_count = int(0.1 * albums_count)  # 10% albums with 1 song
remaining_albums_count = albums_count - one_song_albums_count
max_songs_per_album = 20  # Max possible songs per album

# Track used titles upfront
used_titles = set()

# Create a list of unique album titles upfront
unique_titles = []
for prefix in prefixes:
    for suffix in suffixes:
        title = f"{prefix} {suffix}"
        if title not in used_titles:
            unique_titles.append(title)
            used_titles.add(title)

# We will ensure no duplicates by cycling through the unique titles
# and appending a suffix if needed.

# First, assign 1 song to 10% of albums
for i in range(one_song_albums_count):
    title = unique_titles[i % len(unique_titles)]
    # Randomly choose an artist for the album
    author_artist_id = random.choice(artist_ids)
    release_date = sorted_release_dates[i]
    albums_data.append((title, author_artist_id, 1, release_date))

# Then, assign songs to the remaining albums
remaining_songs = desired_total_songs - one_song_albums_count  # Total songs left to distribute
average_songs_per_album = remaining_songs // remaining_albums_count

# Distribute remaining songs across the albums
for i in range(one_song_albums_count, albums_count):
    title = unique_titles[i % len(unique_titles)]
    
    # Ensure the number of songs doesn't exceed max_songs_per_album
    num_songs = average_songs_per_album
    
    # Distribute any remaining songs randomly
    if remaining_songs % remaining_albums_count > 0:
        num_songs += 1
        remaining_songs -= 1

    num_songs = min(num_songs, max_songs_per_album)
    
    # Randomly choose an artist for the album
    author_artist_id = random.choice(artist_ids)
    release_date = sorted_release_dates[i]
    
    # Append the album data
    albums_data.append((title, author_artist_id, num_songs, release_date))

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO Album (Title, AuthorArtistID, NumberOfSongs, ReleaseDate)
VALUES (%s, %s, %s, %s)
"""

# Execute the SQL INSERT statements for the albums in batches
batch_size = 500  # Adjust the batch size to your needs
for i in range(0, len(albums_data), batch_size):
    cursor.executemany(insert_statement, albums_data[i:i + batch_size])
    cnx.commit()

# Close the cursor and the connection
cursor.close()
cnx.close()

print("Album table has been populated with 2500 records")



# Member
import random
import mysql.connector
from mysql.connector import Error
from datetime import datetime, timedelta
import itertools

# MySQL database connection configuration
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except Error as e:
    print(f"Error: {e}")
    exit(1)

# Lists of distinct first names and last names (now ensuring 70 entries each)
first_names = [
    "Stefani", "Benito", "Belcalis", "Montero", "Ashley", "Abel", "Charlotte", "Jason",
    "Destiny", "Aubrey", "Melissa", "Tramar", "Megan", "Kathryn", "Reginald", "Robyn",
    "Christopher", "Solana", "John", "Amala", "Onika", "Gerald", "Billie", "Peter",
    "Alecia", "Marshall", "Faheem", "Amethyst", "Schaffer", "Elizabeth", "Ella",
    "Elena", "Calvin", "Paul", "Beyoncé", "Kendrick", "Bruno", "Faith", "Audrey",
    "Gertrude", "Hilary", "Joaquin", "Kaleb", "Lavern", "Melissa", "Nadia", "Orlando",
    "Penelope", "Quentin", "Rihanna", "Sebastian", "Taylor", "Uma", "Vanessa", "Willow",
    "Xavier", "Yvette", "Zoe", "Ivy", "Rose", "Liam", "Noah", "Lucas", "Mason", "Ethan",
    "Max", "Luca", "Leah", "Maya", "James"
]

last_names = [
    "Germanotta", "Martínez", "Almanzar", "Hill", "Frangipane", "Tesfaye", "Aitchison", "Desrouleaux",
    "Cyrus", "Graham", "Jefferson", "Dillard", "Pete", "Hudson", "Dwight", "Fenty",
    "Breaux", "Rowe", "Stephens", "Dlamini", "Maraj", "Gillum", "O'Connell", "Hernandez",
    "Moore", "Mathers", "Najm", "Kelly", "Smith", "Grant", "Yelich-O'Connor", "Goulding",
    "Broadus", "Hewson", "Knowles-Carter", "Duckworth", "Haggerty", "McGraw", "Williams", "Bowie",
    "Clarkson", "Dean", "Eastwood", "Franklin", "Gomez", "Harris", "Isaacs", "Jones",
    "King", "Lang", "Mars", "Nash", "Osbourne", "Parker", "Quinn", "Richards",
    "Scott", "Turner", "Underwood", "Valentine", "West", "Young", "Zappa", "Davis", "Ellis", "Ford",
    "Miller", "Wright", "Moore", "Davis"
]

# Lists of prefixes and suffixes for alias generation (now ensuring 70 entries each)
prefixes = [
    "DJ", "The", "Lil", "MC", "Miss", "Sir", "Lady", "King", "Queen", "Captain",
    "Doctor", "Professor", "Lord", "Dame", "Count", "Master", "Sister",
    "Brother", "Admiral", "Chief", "Major", "Colonel", "General", "Sergeant", 
    "Pilot", "Engineer", "Driver", "Handler","Wizard", "Witch", "Seer", "Enchanter", 
    "Enchantress", "Mystic", "Rogue", "Paladin", "Cleric", "Bard", "Hunter", "Shaman","Spellsword",
    "Air", "Earth", "Fire", "Water", "Spirit", "Sun", "Moon", "Star", "Sky", "Sea",
    "Ocean", "Mountain", "River", "Forest", "Valley", "Titan", "Fury", "Iron", "Silver", "Golden",
    "Phoenix", "Storm", "Shadow", "Lightning", "Flame", "Steel", "Dragon", "Wolf", "Bear"
]

suffixes = [
    "Smith", "Jones", "Taylor", "Brown", "Williams", "Wilson", "Johnson", "Robinson",
    "Thompson", "Evans", "Walker", "White", "King", "Hall", "Wood", "Harris",
    "Martin", "Clarke", "Jackson", "Harrison", "Cooper", "Hughes", "Lewis", "Mason",
    "Knight", "Stone", "Adams", "Bell", "Bailey", "Parker", "Bennett", "Owen",
    "Harrison", "Carter", "Patterson", "Richardson", "Ellis", "Edwards", "Stewart", "Morris",
    "Rogers", "Turner", "Watson", "Brooks", "Hamilton", "Fisher", "Palmer", "Cox",
    "Alexander", "Dixon", "Hanson", "Lane", "Knight", "Porter", "West", "Day",
    "James", "Ray", "Ross", "Cole", "Cook", "Woods", "Powell", "Price", "Lee", "Ward",
    "Cooper", "Jameson", "Bradley", "Fletcher"
]

# Check the length of lists to ensure we have 70 entries
print(f"First names length: {len(first_names)}")
print(f"Last names length: {len(last_names)}")
print(f"Prefixes length: {len(prefixes)}")
print(f"Suffixes length: {len(suffixes)}")

# Generate all combinations of first names and last names
name_combinations = list(itertools.product(first_names, last_names))
print(f"Generated {len(name_combinations)} name combinations.")

# Generate all combinations of prefixes and suffixes for aliases
alias_combinations = list(itertools.product(prefixes, suffixes))
print(f"Generated {len(alias_combinations)} alias combinations.")

# Now, let's handle the length mismatch and ensure we only use the minimum of both
length_to_use = min(len(name_combinations), len(alias_combinations))
print(f"Using {length_to_use} combinations for insertion to match the shortest list.")

# Shuffle the combinations to ensure randomness
random.shuffle(name_combinations)
random.shuffle(alias_combinations)

# Function to generate a random date of birth between 1950-2003
def generate_random_dob():
    start_date = datetime(1950, 1, 1)
    end_date = datetime(2003, 12, 31)
    delta_days = (end_date - start_date).days
    random_days = random.randint(0, delta_days)
    random_dob = start_date + timedelta(days=random_days)
    return random_dob.date()

# Prepare the list of records to insert
records = []
for i in range(length_to_use):
    first_name, last_name = name_combinations[i]
    alias = f"{alias_combinations[i][0]} {alias_combinations[i][1]}"
    dob = generate_random_dob()
    activity_status = random.choice([True, False])  # Random activity status

    # Add to the records list
    records.append((first_name, last_name, dob, alias, activity_status))

# SQL insert statement
insert_statement = """
INSERT INTO Member (FirstName, LastName, DateOfBirth, Alias, ActivityStatus)
VALUES (%s, %s, %s, %s, %s)
"""

# Insert the records into the database
try:
    cursor.executemany(insert_statement, records)
    # Commit the transaction
    cnx.commit()
    print(f"Member table has been populated with {len(records)} records.")
except Error as e:
    print(f"Error during insert: {e}")
    cnx.rollback()  # Rollback in case of error

# Close the cursor and the connection
cursor.close()
cnx.close()




# Song
import mysql.connector
import random
from datetime import datetime, timedelta

# MySQL database connection configuration
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except mysql.connector.Error as e:
    print(f"Error: {e}")
    exit(1)

# Retrieve all artists (SpotifyID)
cursor.execute("SELECT SpotifyID FROM Artist")
artist_ids = [row[0] for row in cursor.fetchall()]

# Retrieve all albums (AlbumID, AuthorArtistID, NumberOfSongs)
cursor.execute("SELECT AlbumID, AuthorArtistID, NumberOfSongs FROM Album")
albums_info = cursor.fetchall()

# Prepare a mapping of artist ID to their albums and available slots
artist_album_mapping = {artist_id: [] for artist_id in artist_ids}

# For each album, map the artist to the album and keep track of available slots
for album_id, artist_id, number_of_songs in albums_info:
    if artist_id in artist_album_mapping:
        artist_album_mapping[artist_id].append((album_id, number_of_songs))

# Prepare to insert data into the Song table
songs_data = []

# Use the 80 prefixes and 80 suffixes to create unique song titles
prefixes = [
    "The Last", "Dancing", "Endless", "Whispers of", "Chasing", 
    "Falling", "Dreams of", "Underneath", "Echoes of", "Stars Align", 
    "Heartfelt", "Silent", "Forever", "Lost in", "Breaking", 
    "Shadows of", "Rise of", "Voices in", "Journey to", "Fires of", 
    "Awakening", "Moments of", "Sweet", "Caught in", "Eyes of", 
    "Boundless", "Stormy", "Pieces of", "Infinite", "Reflections of", 
    "Horizon", "Bound by", "Celestial", "In the Night", "Crescent", 
    "Hopes and", "Faded", "Golden", "Ink and", "Shimmering", 
    "Wild", "Melodies of", "Whimsical", "Tides of", "Timeless", 
    "Rhythms of", "Sparks of", "Veil of", "Beneath the", "Dreamcatcher", 
    "Waves of", "Chapters", "Tales of", "Canvas of", "Rivers", 
    "Whirlwind", "Flickering", "Secrets of", "Illuminated", "Adventures", 
    "Voids of", "Shattering", "Eternal", "Eclipsed", "Embers of", 
    "Carpets of", "Winds of", "Midnight", "Echoing", "Kaleidoscope", 
    "Passion in", "Threads of", "Mysteries of", "Lyricism of", "Glimmers", 
    "Serenity", "Faeries", "Gentle", "Fragile", "Notes of", 
    "Windswept", "Chasing Shadows", "Fleeting", "Mosaics of", "Eudaimonia"
]

suffixes = [
    "Moonlight", "Dreams", "Love", "Time", "Amour", 
    "Freedom", "Harmony", "Tomorrow", "Life", "Night",
    "Apocalypse", "Awakening", "Desire", "Goodbye", "Paradise",
    "Illusion", "Moments", "Odyssey", "Echoes", "Signal",
    "Dance", "Vision", "Lyrics", "Tomorrow", "Horizon",
    "Whirlwind", "Whispers", "Reverie", "Fantasy", "Embrace",
    "Journey", "Haven", "Fiction", "Valley", "Fountain",
    "Serenade", "Hearts", "Flow", "Legends", "Regrets",
    "Breath", "Labyrinth", "Paradise", "Tides", "Serenade",
    "Cloudscape", "Memories", "Waves", "Desires", "Bliss",
    "Voids", "Reflections", "Canvas", "Twilight", "Shadows",
    "Elysium", "Rebirth", "Songs", "Loveletters", "Moods",
    "Strings", "Chords", "Essence", "Mirage", "Lullaby",
    "Starlit", "Dreamscape", "Nightfall", "Conversations", "Mythos",
    "Sorrows", "Dimensions", "Experiences", "Alchemy", "Tapestry",
    "Fields", "Refuge", "Horizon", "Tales", "Sanctuary"
]

# Generate 6,400 unique song titles using combinations of prefixes and suffixes
song_titles = [f"{prefix} {suffix}" for prefix in prefixes for suffix in suffixes]
song_titles = song_titles[:6400]  # Ensure we only take the first 6400 titles

# Set up date range for song release date
start_date = datetime(2000, 1, 1)
end_date = datetime(2024, 12, 31)

# Loop through each artist
for artist_id in artist_ids:
    # Get all albums for the current artist
    artist_albums = artist_album_mapping[artist_id]

    # Loop through the albums and assign songs to them
    for album_id, max_songs in artist_albums:
        # Determine the number of songs to assign to this album (respecting max number of songs per album)
        num_songs_to_add = min(max_songs, 3)  # Assign a maximum of 3 songs per album
        
        for _ in range(num_songs_to_add):
            # Generate random song data
            song_title = random.choice(song_titles)  # Pick a random song title
            release_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))  # Random release date
            streams = random.randint(100, 1000000000)  # Random number of streams
            sales = round(random.uniform(0, 10000000), 2)  # Random sales figure

            # Insert the song data with the correct artist and album IDs
            songs_data.append((song_title, release_date, streams, sales, artist_id, album_id))

# Prepare the SQL INSERT statement for the songs
insert_statement = """
INSERT INTO Song (Title, ReleaseDate, Streams, Sales, AuthorArtistID, AlbumID)
VALUES (%s, %s, %s, %s, %s, %s)
"""

# Insert the song data into the database
try:
    cursor.executemany(insert_statement, songs_data)
    cnx.commit()
    print(f"Song table has been populated with {len(songs_data)} records.")
except mysql.connector.Error as e:
    print(f"Error while inserting data: {e}")

# Close the cursor and connection
cursor.close()
cnx.close()


# Awards
import mysql.connector
import random
from datetime import datetime, timedelta

# MySQL database connection configuration
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()

    # List of song award categories (removed duplicate category)
    award_categories = [
        'Song of the Year',
        'Best Song Written for Visual Media',
        'Best American Roots Song',
        'Best Gospel Performance/Song',
        'Best Contemporary Christian Music Performance/Song',
        'Favorite Music Video',
        'Top Hot 100 Song',
        'Best Song'
    ]

    # Retrieve SpotifyID from Artist table
    cursor.execute("SELECT SpotifyID FROM Artist")
    spotify_ids = [row[0] for row in cursor.fetchall()]

    # Generate award tuples
    awards_data = []
    current_year = datetime.now().year

    for _ in range(180):
        # Randomly generate award details
        title = f"Award for {random.choice(award_categories)}"
        
        # Ensure the title length doesn't exceed the database limit (60 characters)
        max_title_length = 60
        if len(title) > max_title_length:
            title = title[:max_title_length]  # Truncate to the maximum length

        # Ensure the category length doesn't exceed the database limit (30 characters)
        category = random.choice(award_categories)
        max_category_length = 30
        if len(category) > max_category_length:
            category = category[:max_category_length]  # Truncate to the maximum length

        presentation_date = datetime.now() - timedelta(days=random.randint(1, 3650))  # Random date in the last 10 years
        value = round(random.uniform(1000.00, 50000.00), 2)  # Random value between 1000.00 and 50000.00
        creation_year = datetime(random.randint(1990, current_year), random.randint(1, 12), random.randint(1, 28))  # Random year between 1990 and current year
        recipient_artist_id = random.choice(spotify_ids)  # Randomly select an artist's SpotifyID
        
        # Append the generated award to the awards_data list
        awards_data.append((title, presentation_date.date(), value, category, creation_year.date(), recipient_artist_id))

    # Prepare the SQL INSERT statement for populating the Awards table
    insert_statement = """
    INSERT INTO Awards (Title, PresentationDate, Value, Category, CreationYear, RecipientArtistID)
    VALUES (%s, %s, %s, %s, %s, %s)
    """

    # Execute the SQL INSERT statement for the awards
    cursor.executemany(insert_statement, awards_data)

    # Commit the transaction
    cnx.commit()

    print("Awards table has been populated with 180 records.")

except mysql.connector.Error as e:
    print(f"Error: {e}")

finally:
    if cursor:
        cursor.close()
    if cnx:
        cnx.close()
        
        
        
        
# Membership
import mysql.connector
import random
from datetime import datetime, timedelta

# Establish connection to the database
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except mysql.connector.Error as e:
    print(f"Error: {e}")
    exit(1)

# Function to generate a random date between a given start and end year
def generate_random_date(start_year, end_year=None):
    # Start date is at the beginning of the start_year
    start_date = datetime(start_year, 1, 1)
    # End date is the end of the year, or the current date if no end_year is provided
    end_date = datetime(end_year if end_year else datetime.now().year, 12, 31)
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    random_date = start_date + timedelta(days=random_days)
    return random_date.strftime('%Y-%m-%d')

# Function to generate random roles for members
def get_random_role():
    roles = ['Vocalist', 'Guitarist', 'Bassist', 'Drummer', 'Keyboardist', 'Rhythmist', 'DJ']
    return random.choice(roles)

# Get the list of ArtistIDs and MemberIDs
cursor.execute("SELECT SpotifyID, CreationYear, EndYear FROM Artist")
artists = cursor.fetchall()  # Fetch artist data (SpotifyID, CreationYear, EndYear)

cursor.execute("SELECT MemberID FROM Member")
member_ids = [row[0] for row in cursor.fetchall()]

# Shuffle the member list for randomness
random.shuffle(member_ids)

# Make sure we have enough artists and members
if len(artists) < 1600 or len(member_ids) < 4900:
    print("Error: Not enough artists or members in the database.")
    exit(1)

# Number of artists to assign to each group
artists_with_1_member = 320
artists_with_4_members = 540 
artists_with_3_members = 740  

# Check if total artists and members fit the scenario
total_artists = artists_with_1_member + artists_with_4_members + artists_with_3_members
if total_artists > len(artists):
    print(f"Error: Not enough artists. Expected {total_artists} but found {len(artists)}.")
    exit(1)

# Loop through the artists and assign members
assigned_member_count = 0
for artist_id, creation_year, end_year in artists[:artists_with_1_member]:
    member_id = member_ids[assigned_member_count]
    assigned_member_count += 1
    date_joined = generate_random_date(creation_year, end_year)  # Ensure DateJoined is after CreationYear
    date_left = None if end_year is None else f"{end_year}-12-31"  # Set DateLeft to EndYear if available
    role = get_random_role()

    cursor.execute("""
        INSERT INTO Membership (ArtistID, MemberID, DateJoined, DateLeft, Role)
        VALUES (%s, %s, %s, %s, %s)
    """, (artist_id, member_id, date_joined, date_left, role))

# Artists with 4 members
for artist_id, creation_year, end_year in artists[artists_with_1_member:artists_with_1_member + artists_with_4_members]:
    for j in range(4):
        member_id = member_ids[assigned_member_count]
        assigned_member_count += 1
        date_joined = generate_random_date(creation_year, end_year)  # Ensure DateJoined is after CreationYear
        date_left = None if end_year is None else f"{end_year}-12-31"  # Set DateLeft to EndYear if available
        role = get_random_role()

        cursor.execute("""
            INSERT INTO Membership (ArtistID, MemberID, DateJoined, DateLeft, Role)
            VALUES (%s, %s, %s, %s, %s)
        """, (artist_id, member_id, date_joined, date_left, role))

# Artists with 3 members
for artist_id, creation_year, end_year in artists[artists_with_1_member + artists_with_4_members:]:
    for j in range(3):
        member_id = member_ids[assigned_member_count]
        assigned_member_count += 1
        date_joined = generate_random_date(creation_year, end_year)  # Ensure DateJoined is after CreationYear
        date_left = None if end_year is None else f"{end_year}-12-31"  # Set DateLeft to EndYear if available
        role = get_random_role()

        cursor.execute("""
            INSERT INTO Membership (ArtistID, MemberID, DateJoined, DateLeft, Role)
            VALUES (%s, %s, %s, %s, %s)
        """, (artist_id, member_id, date_joined, date_left, role))

# Commit the transactions
cnx.commit()

# Update Membership table to set the DateLeft based on the Artist EndYear
for artist_id, _, end_year in artists:
    if end_year is not None:
        cursor.execute("""
            UPDATE Membership
            SET DateLeft = %s
            WHERE ArtistID = %s AND DateLeft IS NULL
        """, (f"{end_year}-12-31", artist_id))  # Set the DateLeft to the end of the year

# Commit the updates
cnx.commit()

# Close the connection
cursor.close()
cnx.close()

print("Membership table populated successfully with 4900 tuples.")


# Collaboration
import mysql.connector
import random

# Connect to the MySQL database
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except mysql.connector.Error as e:
    print(f"Error: {e}")
    exit(1)

# Function to generate random string for 'Type' column
def generate_random_type():
    types = ['Featured', 'Remix', 'Collaboration', 'Cover', 'Production', 'Sample']
    return random.choice(types)

# Fetch existing ISRCCode and corresponding ArtistID pairs from the Song table
cursor.execute("""
    SELECT s.ISRCCode, s.AuthorArtistID 
    FROM Song s
    WHERE s.AuthorArtistID IS NOT NULL
""")
isrc_artist_pairs = cursor.fetchall()

# Check if we have enough data to insert
if not isrc_artist_pairs:
    print("Error: No valid ISRCCode-ArtistID pairs found.")
    exit(1)

# Generate 200 random rows for the 'Collaboration' table using existing ISRCCode-ArtistID pairs
for _ in range(200):
    if not isrc_artist_pairs:
        print("Error: Not enough ISRCCode-ArtistID pairs to insert 200 rows.")
        break

    # Pop a random pair from the list (removes it from the list after use)
    isrc_code, artist_id = isrc_artist_pairs.pop(random.randint(0, len(isrc_artist_pairs) - 1))

    # Random Type for the collaboration
    type_of_collaboration = generate_random_type()

    # Construct the SQL INSERT statement
    insert_query = """
    INSERT INTO Collaboration (ISRCCode, ArtistID, Type)
    VALUES (%s, %s, %s)
    """

    # Execute the insert statement with selected values
    try:
        cursor.execute(insert_query, (isrc_code, artist_id, type_of_collaboration))
    except mysql.connector.Error as e:
        print(f"Error inserting data: {e}")
        continue

# Commit the transaction to save changes to the database
cnx.commit()

# Close the cursor and connection
cursor.close()
cnx.close()

print("200 tuples inserted into the Collaboration table.")


# Multi Genre Type
import mysql.connector
from random import sample, randint

# Connect to the MySQL database
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
    print("Successfully connected to the database.")
except mysql.connector.Error as e:
    print(f"Error: {e}")
    exit(1)

# Retrieve all genre names from the Genre table
cursor.execute('SELECT Name FROM Genre')
genres = [row[0] for row in cursor.fetchall()]  # List of genre names

# Retrieve all ISRC codes from the Song table
cursor.execute('SELECT ISRCCode FROM Song')
songs = [row[0] for row in cursor.fetchall()]  # List of ISRC codes

# Prepare data for MultiGenreType table insertion
multi_genre_data = []
for _ in range(1600):
    # Randomly pick a song ISRC code (ensure the song exists)
    isrc_code = sample(songs, 1)[0]  # Randomly pick one song
    
    # Randomly pick 2-3 genres for this song
    num_genres = randint(2, 3)  # Pick between 2 or 3 genres
    selected_genres = sample(genres, num_genres)  # 2 or 3 genres
    
    # Determine the type based on the number of genres
    genre_type = '2 Genres' if num_genres == 2 else '3 Genres'
    
    # Prepare data for MultiGenreType for each genre associated with this song
    for genre in selected_genres:
        multi_genre_data.append((genre, isrc_code, genre_type))  # Assign correct type (Type 2 or Type 3)

# Bulk insert into the MultiGenreType table
try:
    cursor.executemany('''INSERT IGNORE INTO MultiGenreType (GenreName, ISRCCode, Type)
                          VALUES (%s, %s, %s)''', multi_genre_data)
    cnx.commit()
    print(f"Successfully inserted records into MultiGenreType.")
except mysql.connector.Error as e:
    print(f"Error during insertion: {e}")
    cnx.rollback()

# Close the connection
cursor.close()
cnx.close()



# Production
import mysql.connector
import random
from datetime import timedelta

# Database connection configuration
config = {
    'user': 'root',
    'password': password,
    'host': 'localhost',
    'database': 'SongSelector'
}

# Try connecting to the database
try:
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()

except mysql.connector.Error as err:
    print(f"Error: {err}")
    exit(1)

# Function to calculate the production date (one year before the release date)
def calculate_production_date(release_date):
    return release_date - timedelta(days=365)

# Retrieve ProducerID from Producer table
cursor.execute("SELECT ProducerID FROM Producer")
producer_ids = [row[0] for row in cursor.fetchall()]
print(f"Producer IDs retrieved: {len(producer_ids)}")  # Debugging line

# Retrieve ISRCCode and ReleaseDate from Song table
cursor.execute("SELECT ISRCCode, ReleaseDate FROM Song")
songs_data = cursor.fetchall()
print(f"Song records retrieved: {len(songs_data)}")  # Debugging line

# Define possible roles for the production
roles = ["Composer", "Producer", "Engineer", "Arranger"]

# Prepare data for inserting into the Production table
production_data = []

# Iterate through the songs data to generate production entries
for isrc_code, release_date in songs_data:
    # Ensure release_date is valid
    if release_date:
        production_date = calculate_production_date(release_date)  # Calculate production date
        producer_id = random.choice(producer_ids)  # Randomly select a producer
        role = random.choice(roles)  # Randomly assign a role
        production_data.append((producer_id, isrc_code, production_date, role))
    else:
        print(f"Skipping song with ISRC {isrc_code} due to invalid release date.")  # Debugging line

print(f"Production data prepared: {len(production_data)} records")  # Debugging line

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO Production (ProducerID, ISRCCode, Date, Role)
VALUES (%s, %s, %s, %s)
"""

# Execute the SQL INSERT statements for the Production table
try:
    if production_data:  # Ensure that there is data to insert
        cursor.executemany(insert_statement, production_data)
        connection.commit()  # Commit the changes to the database
        print(f"Production table has been populated with {len(production_data)} records.")
    else:
        print("No data to insert.")
except mysql.connector.Error as err:
    print(f"Error while inserting data: {err}")

# Close the cursor and the connection
finally:
    cursor.close()
    connection.close()
    
    
# Live Events
import mysql.connector
import random
from datetime import datetime, timedelta

# Connect to the MySQL database using direct connection setup
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except mysql.connector.Error as e:
    print(f"Error: {e}")
    exit(1)

# Fetch SpotifyID from Artist table
try:
    cursor.execute("SELECT SpotifyID FROM Artist")
    artist_ids = [row[0] for row in cursor.fetchall()]
except mysql.connector.Error as err:
    print(f"Error fetching artist IDs: {err}")
    cursor.close()
    cnx.close()
    exit(1)

# Fetch countries from Region table
try:
    cursor.execute("SELECT Country FROM Region")
    locations = [row[0] for row in cursor.fetchall()]
except mysql.connector.Error as err:
    print(f"Error fetching locations: {err}")
    cursor.close()
    cnx.close()
    exit(1)

# Define function to generate random dates
def random_date(start_date, end_date):
    """Generate a random date between start_date and end_date."""
    time_between_dates = end_date - start_date
    random_number_of_days = random.randrange(time_between_dates.days)
    return start_date + timedelta(days=random_number_of_days)

# Event name prefixes and suffixes
prefixes = [
    "Festival", "Concert", "Symphony", "Extravaganza", "Gala",
    "Music Night", "Showcase", "Jam Session", "Performance", "Recital"
]
suffixes = [
    "2024", "Live", "Extravaganza", "Night", "Event",
    "Bonanza", "Mega Show", "Show", "Fiesta", "Gala"
]

# Generate unique event names
event_names = set()
for prefix in prefixes:
    for suffix in suffixes:
        event_names.add(f"{prefix} {suffix}")

# Convert set to list and slice to the first 100 unique names
event_names = list(event_names)[:100]

# Prepare data for inserting into the LiveEvents table
live_events_data = []
start_date = datetime(2020, 1, 1)
end_date = datetime(2025, 12, 31)

for name in event_names:
    date = random_date(start_date, end_date)
    location = random.choice(locations)

    # Each event is hosted by only one artist (no multiple hosts)
    host_artist_id = random.choice(artist_ids)

    live_events_data.append((date, name, host_artist_id, location))

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO LiveEvents (Date, Name, HostArtistID, Location)
VALUES (%s, %s, %s, %s)
"""

# Execute the SQL INSERT statements for the live events
try:
    cursor.executemany(insert_statement, live_events_data)
    cnx.commit()
    print("LiveEvents table has been populated with 100 records.")
except mysql.connector.Error as err:
    print(f"Error while inserting data: {err}")

# Close the cursor and the connection
cursor.close()
cnx.close()




# Performance Type
import mysql.connector
import random

# Connect to the MySQL database using direct connection setup
try:
    cnx = mysql.connector.connect(user='root', password=password,
                                  host='localhost', database='SongSelector')
    cursor = cnx.cursor()
except mysql.connector.Error as e:
    print(f"Error: {e}")
    exit(1)

# Initialize artist_event_pairs
artist_event_pairs = []

# Fetch ArtistID and corresponding LiveEventID pairs from LiveEvents table
try:
    cursor.execute("""SELECT HostArtistID, LiveEventID FROM LiveEvents""")
    artist_event_pairs = cursor.fetchall()
    
    # Debugging: Print the number of records fetched
    print(f"Number of artist-event pairs fetched: {len(artist_event_pairs)}")
    
    if not artist_event_pairs:
        raise ValueError("No artist-event pairs found in the database.")
except mysql.connector.Error as err:
    print(f"Error fetching artist-event pairs: {err}")
    cursor.close()
    cnx.close()
    exit(1)
except ValueError as ve:
    print(f"Error: {ve}")
    cursor.close()
    cnx.close()
    exit(1)

# List of 2 performance types
performance_types = ["Rave", "Concert", "Artist Showcase", "Private Event", "Tribute Performance"]

# Prepare data for the PerformanceType table
performance_data = []

# Shuffle the artist_event_pairs list to get a random order
random.shuffle(artist_event_pairs)

# Generate 100 records, ensuring ArtistID and EventID pair from LiveEvents
for _ in range(100):
    if artist_event_pairs:  # Only proceed if there are still artist-event pairs available
        # Pop a random pair from the list (removes it from the list after use)
        artist_id, event_id = artist_event_pairs.pop()
        role = random.choice(performance_types)  # Randomly choose a performance type

        # Check if the (ArtistID, EventID) pair already exists in PerformanceType
        cursor.execute("""
            SELECT COUNT(*) FROM PerformanceType WHERE ArtistID = %s AND EventID = %s
        """, (artist_id, event_id))
        count = cursor.fetchone()[0]

        if count == 0:  # Only insert if no matching record is found
            performance_data.append((artist_id, event_id, role))
        else:
            print(f"Skipping duplicate entry: ArtistID={artist_id}, EventID={event_id}")
    else:
        print("No valid artist-event pairs left to choose from.")
        break

# Debugging: Print how many records will be inserted
print(f"Number of records to insert: {len(performance_data)}")

# Prepare the SQL INSERT statement
insert_statement = """
INSERT INTO PerformanceType (ArtistID, EventID, Type)
VALUES (%s, %s, %s)
"""

# Execute the SQL INSERT statements for the performance types
try:
    if performance_data:
        cursor.executemany(insert_statement, performance_data)
        cnx.commit()
        print(f"Inserted {cursor.rowcount} records into PerformanceType table.")
    else:
        print("No performance data to insert.")
except mysql.connector.Error as err:
    print(f"Error while inserting data: {err}")

# Properly close the cursor and the connection
finally:
    cursor.close()
    cnx.close()
