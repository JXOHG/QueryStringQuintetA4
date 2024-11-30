import React, { useState } from 'react';

const API_BASE_URL = 'http://localhost:5000'
const tableFields = {
  artist: ['SpotifyID', 'Name', 'CreationYear', 'EndYear', 'YearsActive', 'NumberOfMembers', 'MonthlyListeners', 'FromRegion', 'LabelID'],
  song: ['ISRCCode', 'Title', 'ReleaseDate', 'Streams', 'Sales', 'AuthorArtistID', 'AlbumID'],
  album: ['AlbumID', 'Title', 'AuthorArtistID', 'NumberOfSongs', 'ReleaseDate'],
  label: ['LabelID', 'LabelName', 'CompanyName', 'Type']
};

export function InsertDataForm() {
  const [selectedTable, setSelectedTable] = useState('');
  const [formData, setFormData] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const [message, setMessage] = useState('');

  const handleTableChange = (e) => {
    const table = e.target.value;
    setSelectedTable(table);
    setFormData({});
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prevData => ({
      ...prevData,
      [name]: value
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    setMessage('');

    try {
      const response = await fetch(`${API_BASE_URL}/api/insert`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          table: selectedTable,
          fields: formData,
        }),
      });

      const result = await response.json();

      if (!response.ok) {
        throw new Error(result.error || 'Failed to insert data');
      }

      setMessage(`Data inserted successfully with ID: ${result.id}`);
      setFormData({});
    } catch (error) {
      console.error('Error inserting data:', error);
      setMessage(`Failed to insert data: ${error.message}`);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label htmlFor="table" className="block text-sm font-medium text-gray-700">Table</label>
        <select
          id="table"
          name="table"
          value={selectedTable}
          onChange={handleTableChange}
          required
          className="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md"
        >
          <option value="">Select a table</option>
          {Object.keys(tableFields).map((table) => (
            <option key={table} value={table}>{table.charAt(0).toUpperCase() + table.slice(1)}</option>
          ))}
        </select>
      </div>

      {selectedTable && tableFields[selectedTable].map((field) => (
        <div key={field}>
          <label htmlFor={field} className="block text-sm font-medium text-gray-700">{field}</label>
          <input
            type="text"
            id={field}
            name={field}
            value={formData[field] || ''}
            onChange={handleInputChange}
            required
            className="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
          />
        </div>
      ))}

      {selectedTable && (
        <div>
          <button
            type="submit"
            disabled={isLoading}
            className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          >
            {isLoading ? "Inserting..." : "Insert Data"}
          </button>
        </div>
      )}

      {message && (
        <div className={`mt-2 text-sm ${message.includes('successfully') ? 'text-green-600' : 'text-red-600'}`}>
          {message}
        </div>
      )}
    </form>
  );
}

