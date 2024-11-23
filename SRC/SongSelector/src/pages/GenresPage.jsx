import React, { useState, useEffect } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"

export default function GenresPage() {
  const [topGenres, setTopGenres] = useState([])

  useEffect(() => {
    // TODO: Implement API call to backend
    const fetchTopGenres = async () => {
      console.log('Fetching top genres by number of songs')
      // const response = await fetch('/api/top-genres')
      // const data = await response.json()
      // setTopGenres(data)
    }
    fetchTopGenres()
  }, [])

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Top Genres by Number of Songs</h1>
      <Card>
        <CardHeader>
          <CardTitle>Most Popular Genres</CardTitle>
        </CardHeader>
        <CardContent>
          {topGenres.length > 0 ? (
            <ol>
              {topGenres.map((genre, index) => (
                <li key={index}>{genre.name} - {genre.songCount} songs</li>
              ))}
            </ol>
          ) : (
            <p>Loading top genres...</p>
          )}
        </CardContent>
      </Card>
    </div>
  )
}

