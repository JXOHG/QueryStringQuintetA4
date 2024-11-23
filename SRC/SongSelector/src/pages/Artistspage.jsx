import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function ArtistsPage() {
  const [artist, setArtist] = useState('')
  const [members, setMembers] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching active members for artist/band: ${artist}`)
    // const response = await fetch(`/api/active-members?artist=${artist}`)
    // const data = await response.json()
    // setMembers(data)
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Active Members of Artists/Bands</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Active Members</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex space-x-2">
            <Input
              type="text"
              placeholder="Enter artist/band name"
              value={artist}
              onChange={(e) => setArtist(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {members.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Active Members</CardTitle>
          </CardHeader>
          <CardContent>
            <ul>
              {members.map((member, index) => (
                <li key={index}>{member.name} - {member.role}</li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

