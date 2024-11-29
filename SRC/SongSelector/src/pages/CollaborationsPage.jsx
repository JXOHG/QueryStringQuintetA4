import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

const API_BASE_URL = 'http://localhost:5000'

export default function CollaborationsPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [collaborations, setCollaborations] = useState([])
  const [error, setError] = useState(null)
  const [isLoading, setIsLoading] = useState(false)

  const handleSearch = async (e) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)
    
    try {
      const response = await fetch(`${API_BASE_URL}/api/collaborations?term=${encodeURIComponent(searchTerm)}`)
      if (!response.ok) {
        throw new Error('Failed to fetch collaborations')
      }
      const data = await response.json()
      setCollaborations(data)
      
      if (data.length === 0) {
        setError('No collaborations found for this artist')
      }
    } catch (error) {
      setError('An error occurred while searching. Please try again.')
      console.error('Search error:', error)
    } finally {
      setIsLoading(false)
    }
  }

  // Format date to be more readable
  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    // Handle both ISO string and date-only string formats
    const date = new Date(dateString);
    if (isNaN(date.getTime())) {
      // If invalid date, try parsing YYYY-MM-DD format
      const [year, month, day] = dateString.split('-').map(Number);
      return new Date(year, month - 1, day).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
    }
    return date.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  };

  // Format large numbers with commas
  const formatNumber = (number) => {
    return new Intl.NumberFormat('en-US').format(number)
  }

  return (
    <div className="max-w-[1200px] mx-auto p-4">
      <h1 className="text-3xl font-bold mb-6">Track Artist Collaboration History</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Artist Collaborations</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex space-x-2">
            <Input
              type="text"
              placeholder="Enter artist name"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit" disabled={isLoading}>
              {isLoading ? 'Searching...' : 'Search'}
            </Button>
          </form>
          {error && (
            <p className="text-red-500 mt-2">{error}</p>
          )}
        </CardContent>
      </Card>

      {collaborations.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Collaboration History</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="rounded-md border">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Main Artist</TableHead>
                    <TableHead>Song Title</TableHead>
                    <TableHead className="hidden md:table-cell">Release Date</TableHead>
                    <TableHead className="hidden sm:table-cell">Streams</TableHead>
                    <TableHead>Collaborating Artist</TableHead>
                    <TableHead className="hidden lg:table-cell">Collaboration Type</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {collaborations.map((collab, index) => (
                    <TableRow key={index}>
                      <TableCell className="font-medium">{collab.MainArtist}</TableCell>
                      <TableCell>{collab.SongTitle}</TableCell>
                      <TableCell className="hidden md:table-cell">
                        {formatDate(collab.ReleaseDate)}
                      </TableCell>
                      <TableCell className="hidden sm:table-cell">
                        {formatNumber(collab.Streams)}
                      </TableCell>
                      <TableCell>{collab.CollaboratingArtist}</TableCell>
                      <TableCell className="hidden lg:table-cell">
                        {collab.CollaborationType}
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

