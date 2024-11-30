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

export default function ProducersPage() {
  const API_BASE_URL = 'http://localhost:5000'
  const [producer, setProducer] = useState('')
  const [genre, setGenre] = useState('')
  const [contributions, setContributions] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    try {
      console.log(`Searching contributions for producer: ${producer}, genre: ${genre}`)
      const response = await fetch(`${API_BASE_URL}/api/producer-contributions?producer=${producer}&genre=${genre}`)
      
      if (!response.ok) {
        throw new Error('Network response was not ok')
      }
      
      const data = await response.json()
      setContributions(data)
    } catch (error) {
      console.error("Error fetching contributions:", error)
      setContributions([])
    }
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Producer Contributions by Genre</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search Producer Contributions</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex flex-col space-y-2">
            <Input
              type="text"
              placeholder="Enter producer name"
              value={producer}
              onChange={(e) => setProducer(e.target.value)}
            />
            <Input
              type="text"
              placeholder="Enter genre"
              value={genre}
              onChange={(e) => setGenre(e.target.value)}
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {contributions.length > 0 && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle>Search Result</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Producer First Name</TableHead>
                  <TableHead>Producer Last Name</TableHead>
                  <TableHead>Song Title</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {contributions.map((contribution) => (
                  <TableRow key={contribution.SongTitle}>
                    <TableCell>{contribution.ProducerFirstName}</TableCell>
                    <TableCell>{contribution.ProducerLastName}</TableCell>
                    <TableCell>{contribution.SongTitle}</TableCell>
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