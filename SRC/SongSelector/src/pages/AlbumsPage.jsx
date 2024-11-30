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

export default function AlbumsPage() {
  const API_BASE_URL = 'http://localhost:5000'
  const [searchTerm, setSearchTerm] = useState('')
  const [albums, setAlbums] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching for albums: ${searchTerm}`)
    const response = await fetch(`${API_BASE_URL}/api/album?term=${searchTerm}`)
    const data = await response.json()
    setAlbums(data)
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Albums</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search Albums</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex space-x-2">
            <Input
              type="text"
              placeholder="Enter album or artist name"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {albums.length > 0 && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle>Search Result</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Title</TableHead>
                  <TableHead>Album ID</TableHead>
                  <TableHead>Author ID</TableHead>
                  <TableHead>Number of Songs</TableHead>
                  <TableHead>Release Date</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {albums.map((albums) => (
                  <TableRow key={albums.AlbumID}>
                    <TableCell>{albums.Title}</TableCell>
                    <TableCell>{albums.AlbumID}</TableCell>
                    <TableCell>{albums.AuthorArtistID}</TableCell>
                    <TableCell>{albums.NumberOfSongs}</TableCell>
                    <TableCell>{albums.ReleaseDate}</TableCell>
                    
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