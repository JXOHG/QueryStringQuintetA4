import React, { useState, useEffect } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

export default function GenresPage() {
  const API_BASE_URL = 'http://localhost:5000'
  const [topGenres, setTopGenres] = useState([])

  useEffect(() => {
    const fetchTopGenres = async () => {
      try {
        console.log('Fetching top genres by number of songs')
        const response = await fetch(`${API_BASE_URL}/api/top-genres`)
        
        if (!response.ok) {
          throw new Error('Network response was not ok')
        }
        
        const data = await response.json()
        setTopGenres(data)
      } catch (error) {
        console.error("Error fetching top genres:", error)
      }
    }
    fetchTopGenres()
  }, [])

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Top Genres by Number of Songs</h1>
      {topGenres.length > 0 && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle>Top Genres by Number of Songs</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Genre Name</TableHead>
                  <TableHead>Number of Songs</TableHead>
                  <TableHead>Description</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {topGenres.map((genre) => (
                  <TableRow key={genre.GenreName}>
                    <TableCell>{genre.GenreName}</TableCell>
                    <TableCell>{genre.NumberOfSongs}</TableCell>
                    <TableCell>{genre.Description}</TableCell>
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