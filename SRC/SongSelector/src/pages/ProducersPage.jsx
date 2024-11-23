import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function ProducersPage() {
  const [producer, setProducer] = useState('')
  const [genre, setGenre] = useState('')
  const [contributions, setContributions] = useState(null)

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching contributions for producer: ${producer}, genre: ${genre}`)
    // const response = await fetch(`/api/producer-contributions?producer=${producer}&genre=${genre}`)
    // const data = await response.json()
    // setContributions(data)
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

      {contributions && (
        <Card>
          <CardHeader>
            <CardTitle>Producer Contributions</CardTitle>
          </CardHeader>
          <CardContent>
            <p>Producer: {contributions.producer}</p>
            <p>Genre: {contributions.genre}</p>
            <p>Total Songs: {contributions.totalSongs}</p>
            <p>Notable Artists: {contributions.notableArtists.join(', ')}</p>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

