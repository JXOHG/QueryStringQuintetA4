import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function StreamingPage() {
  const [artist, setArtist] = useState('')
  const [topSongs, setTopSongs] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching top streamed songs for artist: ${artist}`)
    // const response = await fetch(`/api/top-streamed?artist=${artist}`)
    // const data = await response.json()
    // setTopSongs(data)
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Top 5 Most Streamed Songs</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Artist's Top Streamed Songs</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex space-x-2">
            <Input
              type="text"
              placeholder="Enter artist name"
              value={artist}
              onChange={(e) => setArtist(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {topSongs.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Top 5 Most Streamed Songs</CardTitle>
          </CardHeader>
          <CardContent>
            <ol>
              {topSongs.map((song, index) => (
                <li key={index}>{song.title} - {song.streams} streams</li>
              ))}
            </ol>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

