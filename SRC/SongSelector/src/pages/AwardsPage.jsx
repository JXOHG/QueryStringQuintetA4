import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function AwardsPage() {
  const [artist, setArtist] = useState('')
  const [awards, setAwards] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching awards for artist: ${artist}`)
    // const response = await fetch(`/api/awards?artist=${artist}`)
    // const data = await response.json()
    // setAwards(data)
  }

  return (
    <div>
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
              value={artist}
              onChange={(e) => setArtist(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {awards.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Awards Won</CardTitle>
          </CardHeader>
          <CardContent>
            <ul>
              {awards.map((award, index) => (
                <li key={index}>{award.name} - {award.year}</li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

