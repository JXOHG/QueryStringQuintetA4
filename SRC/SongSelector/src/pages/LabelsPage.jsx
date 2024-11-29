import React, { useState, useEffect } from 'react'
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

export default function LabelsPage() {
  const API_BASE_URL = 'http://localhost:5000'
  const [topLabels, setTopLabels] = useState([])
  const [searchTerm, setSearchTerm] = useState('')
  const [labelResults, setLabelResults] = useState([])
  const [error, setError] = useState(null)
  const [isLoading, setIsLoading] = useState(false)

  useEffect(() => {
    const fetchTopLabels = async () => {
      try {
        console.log('Fetching top 3 most active labels')
        const response = await fetch(`${API_BASE_URL}/api/top-labels`)
        if (!response.ok) {
          throw new Error('Failed to fetch top labels')
        }
        const data = await response.json()
        setTopLabels(data)
      } catch (error) {
        console.error('Error fetching top labels:', error)
        setError('Failed to load top labels')
      }
    }
    fetchTopLabels()
  }, [])

  const handleLabelSearch = async (e) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)
    
    try {
      const response = await fetch(`${API_BASE_URL}/api/label?term=${encodeURIComponent(searchTerm)}`)
      if (!response.ok) {
        throw new Error('Failed to fetch labels')
      }
      const data = await response.json()
      setLabelResults(data)
      
      if (data.length === 0) {
        setError('No labels found')
      }
    } catch (error) {
      console.error('Error fetching labels:', error)
      setError('An error occurred while searching')
      setLabelResults([])
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="max-w-[1200px] mx-auto p-4">
      <h1 className="text-3xl font-bold mb-6">Labels</h1>
    
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Most Active Labels by Number of Active Artists</CardTitle>
        </CardHeader>

        <CardContent>
          {topLabels.length > 0 && (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Label Name</TableHead>
                  <TableHead>Company Name</TableHead>
                  <TableHead>Active Artists</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {topLabels.map((label) => (
                  <TableRow key={label.LabelName}>
                    <TableCell>{label.LabelName}</TableCell>
                    <TableCell>{label.CompanyName}</TableCell>
                    <TableCell>{label.ActiveArtists}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          )}
        </CardContent>
      </Card>

      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Active Labels</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleLabelSearch} className="flex space-x-2">
            <Input
              type="text"
              placeholder="Enter label name"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit" disabled={isLoading}>
              {isLoading ? 'Searching...' : 'Search'}
            </Button>
          </form>
          {error && <p className="text-red-500 mt-2">{error}</p>}
        </CardContent>
      </Card>

      {labelResults.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Label Search Result</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Label ID</TableHead>
                  <TableHead>Label Name</TableHead>
                  <TableHead>Company Name</TableHead>
                  <TableHead>Type</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {labelResults.map((label) => (
                  <TableRow key={label.LabelID}>
                    <TableCell>{label.LabelID}</TableCell>
                    <TableCell>{label.LabelName}</TableCell>
                    <TableCell>{label.CompanyName}</TableCell>
                    <TableCell>{label.Type}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </CardContent>
        </Card>
      )}
    </div>
  )
}