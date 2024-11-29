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

export default function StreamingPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [topSongs, setTopSongs] = useState([])
  const [error, setError] = useState(null)
  const [isLoading, setIsLoading] = useState(false)

  const handleSearch = async (e) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)
    
    try {
      const response = await fetch(`${API_BASE_URL}/api/top-streamed?term=${encodeURIComponent(searchTerm)}`)
      if (!response.ok) {
        throw new Error('Failed to fetch top streamed songs')
      }
      const data = await response.json()
      setTopSongs(data)
      
      if (data.length === 0) {
        setError('No top streamed songs found for this artist')
      }
    } catch (error) {
      setError('An error occurred while searching. Please try again.')
      console.error('Search error:', error)
    } finally {
      setIsLoading(false)
    }
  }

  // Format large numbers with commas
  const formatNumber = (number) => {
    return new Intl.NumberFormat('en-US').format(number)
  }

  return (
    <div className="max-w-[1200px] mx-auto p-4">
      <h1 className="text-3xl font-bold mb-6">Top Streamed Songs</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Artist's Top Streamed Songs</CardTitle>
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

      {topSongs.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Top Streamed Songs</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="rounded-md border">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>ISRC Code</TableHead>
                    <TableHead>Song Title</TableHead>
                    <TableHead>Artist Name</TableHead>
                    <TableHead>Member First Name</TableHead>
                    <TableHead>Member Last Name</TableHead>
                    <TableHead>Streams</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {topSongs.map((song) => (
                    <TableRow key={song.ISRCCode}>
                      <TableCell>{song.ISRCCode}</TableCell>
                      <TableCell>{song['Song Title']}</TableCell>
                      <TableCell>{song['Artist Name']}</TableCell>
                      <TableCell>{song['Member First Name']}</TableCell>
                      <TableCell>{song['Member Last Name']}</TableCell>
                      <TableCell>{formatNumber(song.Streams)}</TableCell>
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

