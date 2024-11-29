import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { SearchArtist } from "@/components/SearchArtist"
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
const API_BASE_URL = 'http://localhost:5000'

export default function ArtistsPage() {
  const [artist, setArtist] = useState('')
  const [members, setMembers] = useState([])
  const [searchResults, setSearchResults] = useState([])

  const handleMemberSearch = async (e) => {
    e.preventDefault()
    try {
      const response = await fetch(`${API_BASE_URL}/api/active-members?term=${encodeURIComponent(artist)}`)
      if (!response.ok) {
        throw new Error('Failed to fetch active members')
      }
      const data = await response.json()
      setMembers(data)
    } catch (error) {
      console.error('Error fetching active members:', error)
      setMembers([])
    }
  }

  const handleArtistSearch = async (searchTerm) => {
    try {
      const response = await fetch(`${API_BASE_URL}/api/artist?term=${encodeURIComponent(searchTerm)}`)
      if (!response.ok) {
        throw new Error('Failed to fetch artists')
      }
      const data = await response.json()
      setSearchResults(data)
    } catch (error) {
      console.error('Error searching artists:', error)
      setSearchResults([])
    }
  }

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-6">Artists</h1>
      
      <SearchArtist onSearch={handleArtistSearch} />

      {searchResults.length > 0 && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle>Artist Search Results</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Spotify ID</TableHead>
                  <TableHead>Name</TableHead>
                  <TableHead>Creation Year</TableHead>
                  <TableHead>Monthly Listeners</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {searchResults.map((artist) => (
                  <TableRow key={artist.SpotifyID}>
                    <TableCell>{artist.SpotifyID}</TableCell>
                    <TableCell>{artist.Name}</TableCell>
                    <TableCell>{artist.CreationYear}</TableCell>
                    <TableCell>{artist.MonthlyListeners?.toLocaleString()}</TableCell>
                    
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </CardContent>
        </Card>
      )}

      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Active Members</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleMemberSearch} className="flex space-x-2">
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
            <CardTitle>Active Members Search Result</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Member ID</TableHead>
                  <TableHead>First Name</TableHead>
                  <TableHead>Last Name</TableHead>
                  <TableHead>Alias</TableHead>
                  <TableHead>Date of Birth</TableHead>
                  <TableHead>Role</TableHead>
                  <TableHead>Date Joined</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {members.map((member) => (
                  <TableRow key={member.MemberID}>
                    <TableCell>{member.MemberID}</TableCell>
                    <TableCell>{member.FirstName}</TableCell>
                    <TableCell>{member.LastName}</TableCell>
                    <TableCell>{member.Alias}</TableCell>
                    <TableCell>{new Date(member.DateOfBirth).toLocaleDateString()}</TableCell>
                    <TableCell>{member.Role}</TableCell>
                    <TableCell>{new Date(member.DateJoined).toLocaleDateString()}</TableCell>
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

