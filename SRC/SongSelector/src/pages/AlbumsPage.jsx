import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function AlbumsPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [albums, setAlbums] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching for albums: ${searchTerm}`)
    // const response = await fetch(`/api/albums?search=${searchTerm}`)
    // const data = await response.json()
    // setAlbums(data)
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
        <Card>
          <CardHeader>
            <CardTitle>Search Results</CardTitle>
          </CardHeader>
          <CardContent>
            <ul className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {albums.map((album, index) => (
                <li key={index} className="border rounded-lg p-4">
                  <h3 className="font-semibold">{album.title}</h3>
                  <p>Artist: {album.artist}</p>
                  <p>Release Year: {album.releaseYear}</p>
                  <p>Genre: {album.genre}</p>
                </li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}
    </div>
  )
}