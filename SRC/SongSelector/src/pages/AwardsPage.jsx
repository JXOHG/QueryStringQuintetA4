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

export default function AwardsPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [awards, setAwards] = useState([])
  const [error, setError] = useState(null)
  const [isLoading, setIsLoading] = useState(false)

  const handleSearch = async (e) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)
    
    try {
      const response = await fetch(`${API_BASE_URL}/api/awards?term=${encodeURIComponent(searchTerm)}`)
      if (!response.ok) {
        throw new Error('Failed to fetch awards')
      }
      const data = await response.json()
      setAwards(data)
      
      if (data.length === 0) {
        setError('No awards found for this artist')
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

  // Format currency values
  const formatCurrency = (value) => {
    if (!value) return 'N/A';
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(value);
  };

  return (
    <div className="max-w-[1200px] mx-auto p-4">
      <h1 className="text-3xl font-bold mb-6">Artist Awards</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Artist Awards</CardTitle>
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

      {awards.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Awards History</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="rounded-md border">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Artist Name</TableHead>
                    <TableHead>Award Title</TableHead>
                    <TableHead>Presentation Date</TableHead>
                    <TableHead>Award Value</TableHead>
                    <TableHead>Category</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {awards.map((award, index) => (
                    <TableRow key={index}>
                      <TableCell>{award.ArtistName}</TableCell>
                      <TableCell>{award.AwardTitle}</TableCell>
                      <TableCell>{formatDate(award.PresentationDate)}</TableCell>
                      <TableCell>{formatCurrency(award.AwardValue)}</TableCell>
                      <TableCell>{award.Category}</TableCell>
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

