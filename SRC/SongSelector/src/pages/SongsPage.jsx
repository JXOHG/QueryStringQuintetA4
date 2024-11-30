"use client"

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
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"

export default function SongsPage() {
  const API_BASE_URL = 'http://localhost:5000'
  const [artistSongs, setArtistSongs] = useState([])
  const [showArtistSongs, setShowArtistSongs] = useState(false)
  const [searchQuery, setSearchQuery] = useState('')
  const [searchResults, setSearchResults] = useState([])

  useEffect(() => {
    const fetchArtistSongs = async () => {
      console.log('Fetching total songs by artist')
      const response = await fetch(`${API_BASE_URL}/api/artist-songs`)
      const data = await response.json()
      setArtistSongs(data)
    }
    fetchArtistSongs()
  }, [])

  const handleSearch = async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/api/song?query=${searchQuery}`)
      const data = await response.json()
      setSearchResults(data)
    } catch (error) {
      console.error('Error searching for songs:', error)
    }
  }

  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold">Songs Page</h1>

      <div className="flex items-center space-x-2">
        <Input
          type="text"
          placeholder="Search for a song..."
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          className="max-w-sm"
        />
        <Button onClick={handleSearch}>Search</Button>
      </div>

      {searchResults.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Search Results</CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>ISRC Code</TableHead>
                  <TableHead>Title</TableHead>
                  <TableHead>Release Date</TableHead>
                  <TableHead>Streams</TableHead>
                  <TableHead>Sales</TableHead>
                  <TableHead>Author Artist ID</TableHead>
                  <TableHead>Album ID</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {searchResults.map((song) => (
                  <TableRow key={song.ISRCCode}>
                    <TableCell>{song.ISRCCode}</TableCell>
                    <TableCell>{song.Title}</TableCell>
                    <TableCell>{song.ReleaseDate}</TableCell>
                    <TableCell>{song.Streams}</TableCell>
                    <TableCell>{song.Sales}</TableCell>
                    <TableCell>{song.AuthorArtistID}</TableCell>
                    <TableCell>{song.AlbumID}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </CardContent>
        </Card>
      )}

      <Button onClick={() => setShowArtistSongs(!showArtistSongs)}>
        {showArtistSongs ? 'Hide' : 'Show'} Total Songs by Artist
      </Button>

      {showArtistSongs && (
        <Card>
          <CardHeader>
            <CardTitle>Artists by the number of songs</CardTitle>
          </CardHeader>
          <CardContent>
            {artistSongs.length > 0 && (
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Artist Name</TableHead>
                    <TableHead>Spotify ID</TableHead>
                    <TableHead>Number of Songs</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {artistSongs.map((artistSong) => (
                    <TableRow key={artistSong.SpotifyID}>
                      <TableCell>{artistSong.Name}</TableCell>
                      <TableCell>{artistSong.SpotifyID}</TableCell>
                      <TableCell>{artistSong.TotalNumberOfSongs}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            )}
          </CardContent>
        </Card>
      )}
    </div>
  )
}

