import React, { useState, useEffect } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"

export default function SongsPage() {
  const [artistSongs, setArtistSongs] = useState([])

  useEffect(() => {
    // TODO: Implement API call to backend
    const fetchArtistSongs = async () => {
      console.log('Fetching total songs by artist')
      // const response = await fetch('/api/artist-songs')
      // const data = await response.json()
      // setArtistSongs(data)
    }
    fetchArtistSongs()
  }, [])

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Total Songs by Artist</h1>
      <Card>
        <CardHeader>
          <CardTitle>Number of Songs Released by Each Artist</CardTitle>
        </CardHeader>
        <CardContent>
          {artistSongs.length > 0 ? (
            <ul>
              {artistSongs.map((artist, index) => (
                <li key={index}>{artist.name} - {artist.totalSongs} songs</li>
              ))}
            </ul>
          ) : (
            <p>Loading artist song counts...</p>
          )}
        </CardContent>
      </Card>
    </div>
  )
}

