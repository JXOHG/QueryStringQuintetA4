'use client'

import React, { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

const API_BASE_URL = 'http://localhost:5000/api'

export default function Homepage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [searchType, setSearchType] = useState('song')
  const [searchResults, setSearchResults] = useState([])
  const [isLoading, setIsLoading] = useState(false)
  const [error, setError] = useState(null)
  const [stats, setStats] = useState({ songs: 0, artists: 0, albums: 0 })
  const [featuredAwards, setFeaturedAwards] = useState([])
  const [featuredArtists, setFeaturedArtists] = useState([])

  useEffect(() => {
    fetchStats()
    fetchFeaturedAwards()
    fetchFeaturedArtistsByCountry()
  }, [])

  const fetchStats = async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/stats`)
      if (!response.ok) {
        throw new Error('Failed to fetch stats')
      }
      const data = await response.json()
      setStats(data)
    } catch (error) {
      console.error('Error fetching stats:', error)
      setError('Failed to load statistics. Please try again later.')
    }
  }

  const fetchFeaturedAwards = async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/featured-awards`)
      if (!response.ok) {
        throw new Error('Failed to fetch featured awards')
      }
      const data = await response.json()
      setFeaturedAwards(data)
    } catch (error) {
      console.error('Error fetching featured awards:', error)
      setError('Failed to load featured awards. Please try again later.')
    }
  }

  const fetchFeaturedArtistsByCountry = async () => {
    try {
      const response = await fetch(`${API_BASE_URL}/featured-artists-by-country`)
      if (!response.ok) {
        throw new Error('Failed to fetch featured artists in country')
      }
      const data = await response.json()
      setFeaturedArtists(data)
    } catch (error) {
      console.error('Error fetching featured artists:', error)
      setError('Failed to load featured artists. Please try again later.')
    }
  }

  const handleSearch = async (e) => {
    e.preventDefault()
    setIsLoading(true)
    setError(null)
    try {
      let response;
      if (searchType === 'artist') {
        response = await fetch(`${API_BASE_URL}/artist?term=${encodeURIComponent(searchTerm)}`)
      }
      else if (searchType == 'song'){
        response = await fetch(`${API_BASE_URL}/song?term=${encodeURIComponent(searchTerm)}`)
      }
      else if (searchType == 'label'){
        response = await fetch(`${API_BASE_URL}/label?term=${encodeURIComponent(searchTerm)}`)
      }
      else if (searchType == 'album'){
        response = await fetch(`${API_BASE_URL}/album?term=${encodeURIComponent(searchTerm)}`)
      }
      else {
        response = await fetch(`${API_BASE_URL}/search?type=${searchType}&term=${encodeURIComponent(searchTerm)}`)
      }

      if (!response.ok) {
        throw new Error('Search failed')
      }

      const data = await response.json()
      setSearchResults(data)
      
      if (data.length === 0) {
        setError(`No ${searchType}s found`)
      }
    } catch (error) {
      setError('An error occurred while searching. Please try again.')
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-6">SongSelector Database</h1>

      <Card className="mb-6">
        <CardHeader>
          <CardTitle>General Search</CardTitle>
          <CardDescription>Find songs, artists, albums, and labels</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex space-x-2">
            <select
              value={searchType}
              onChange={(e) => setSearchType(e.target.value)}
              className="border rounded px-2 py-1"
            >
              <option value="song">Song</option>
              <option value="artist">Artist</option>
              <option value="album">Album</option>
              <option value="label">Label</option>
            </select>
            <Input
              type="text"
              placeholder={`Search for ${searchType}...`}
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit" disabled={isLoading}>
              {isLoading ? 'Searching...' : 'Search'}
            </Button>
          </form>
        </CardContent>
      </Card>

      {error && (
        <Card className="mb-6 bg-red-100">
          <CardContent>
            <p className="text-red-600">{error}</p>
          </CardContent>
        </Card>
      )}

      {searchResults.length > 0 && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle>Search Results</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead>
                  <tr className="border-b">
                    <th className="text-left p-2">Name</th>
                    {searchType === 'artist' && (
                      <>
                        <th className="text-left p-2">Creation Year</th>
                        <th className="text-left p-2">Monthly Listeners</th>
                      </>
                    )}
                    {searchType === 'song' && (
                      <>
                        <th className="text-left p-2">ISRC Code</th>
                        <th className="text-left p-2">Release Date</th>
                        <th className="text-left p-2">Streams</th>
                        <th className="text-left p-2">Sales</th>
                        <th className="text-left p-2">Author Artist ID</th>
                      </>
                    )}
                    {searchType === 'album' && (
                      <>
                        <th className="text-left p-2">Album ID</th>
                        <th className="text-left p-2">Author Artist ID</th>
                        <th className="text-left p-2">Number of Songs</th>
                        <th className="text-left p-2">Release Date</th>
                      </>
                    )}
                    {searchType === 'label' && (
                      <>
                        <th className="text-left p-2">Label ID</th>
                        <th className="text-left p-2">Company Name</th>
                        <th className="text-left p-2">Type</th>
                      </>
                    )}
                  </tr>
                </thead>
                <tbody>
                  {searchResults.map((result, index) => (
                    <tr key={index} className="border-b">
                      <td className="p-2">{result.Name || result.Title || result.LabelName || 'N/A'}</td>
                      {searchType === 'artist' && (
                        <>
                          <td className="p-2">{result.CreationYear || 'N/A'}</td>
                          <td className="p-2">{result.MonthlyListeners?.toLocaleString() || 'N/A'}</td>
                        </>
                      )}
                      {searchType === 'song' && (
                        <>
                          <td className="p-2">{result.ISRCCode || 'N/A'}</td>
                          <td className="p-2">{result.ReleaseDate || 'N/A'}</td>
                          <td className="p-2">{result.Streams?.toLocaleString() || 'N/A'}</td>
                          <td className="p-2">{result.Sales?.toLocaleString() || 'N/A'}</td>
                          <td className="p-2">{result.AuthorArtistID || 'N/A'}</td>
                        </>
                      )}
                      {searchType === 'album' && (
                        <>
                          <td className="p-2">{result.albumID || 'N/A'}</td>
                          <td className="p-2">{result.AuthorArtistID || 'N/A'}</td>
                          <td className="p-2">{result.NumberOfSongs?.toLocaleString() || 'N/A'}</td>
                          <td className="p-2">{result.ReleaseDate || 'N/A'}</td>
                        </>
                      )}
                      {searchType === 'label' && (
                        <>
                          <td className="p-2">{result.LabelID || 'N/A'}</td>
                          <td className="p-2">{result.CompanyName || 'N/A'}</td>
                          <td className="p-2">{result.Type || 'N/A'}</td>
                        </>
                      )}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </CardContent>
        </Card>
      )}

      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Featured Content</CardTitle>
        </CardHeader>
        <CardContent>
          <Tabs defaultValue="awards" className="w-full">
            <TabsList>
              <TabsTrigger value="awards">Featured Awards</TabsTrigger>
              <TabsTrigger value="artists">Featured Artists in USA</TabsTrigger>
            </TabsList>
            <TabsContent value="awards">
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b">
                      <th className="text-left p-2">Artist Name</th>
                      <th className="text-left p-2">Award Title</th>
                      <th className="text-left p-2">Presentation Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    {featuredAwards.map((award, index) => (
                      <tr key={index} className="border-b">
                        <td className="p-2">{award.ArtistName}</td>
                        <td className="p-2">{award.AwardTitle}</td>
                        <td className="p-2">{new Date(award.PresentationDate).toLocaleDateString()}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </TabsContent>
            <TabsContent value="artists">
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b">
                      <th className="text-left p-2">Artist Name</th>
                      <th className="text-left p-2">Region</th>
                    </tr>
                  </thead>
                  <tbody>
                    {featuredArtists.map((artist, index) => (
                      <tr key={index} className="border-b">
                        <td className="p-2">{artist.ArtistName}</td>
                        <td className="p-2">{artist.Region}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </TabsContent>
          </Tabs>
        </CardContent>
      </Card>

      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Specialized Search</CardTitle>
          <CardDescription>Explore detailed information and statistics</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <Link to="/collaborations" className="block">
              <Button variant="outline" className="w-full">Artist Collaborations</Button>
            </Link>
            <Link to="/awards" className="block">
              <Button variant="outline" className="w-full">Artist Awards</Button>
            </Link>
            <Link to="/streaming" className="block">
              <Button variant="outline" className="w-full">Top Streaming</Button>
            </Link>
            
            <Link to="/artists" className="block">
              <Button variant="outline" className="w-full">Active Band Members</Button>
            </Link>
            <Link to="/labels" className="block">
              <Button variant="outline" className="w-full">Top Active Labels</Button>
            </Link>
            <Link to="/songs" className="block">
              <Button variant="outline" className="w-full">Songs by Artist</Button>
            </Link>
            <Link to="/events" className="block">
              <Button variant="outline" className="w-full">Live Events</Button>
            </Link>
            <Link to="/producers" className="block">
              <Button variant="outline" className="w-full">Producer Contributions</Button>
            </Link>
            <Link to="/genres" className="block">
              <Button variant="outline" className="w-full">Top Genres</Button>
            </Link>
          </div>
        </CardContent>
      </Card>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <Card>
          <CardHeader>
            <CardTitle>Songs</CardTitle>
            <CardDescription>Browse our extensive song collection</CardDescription>
          </CardHeader>
          <CardContent>
            <p>Total Songs: {stats.songs}</p>
            <Link to="/songs"><Button>View All Songs Functions</Button></Link>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Artists</CardTitle>
            <CardDescription>Explore talented artists in our database</CardDescription>
          </CardHeader>
          <CardContent>
            <p>Total Artists: {stats.artists}</p>
            <Link to="/artists"><Button>View All Artists Functions</Button></Link>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Albums</CardTitle>
            <CardDescription>Discover albums from various genres</CardDescription>
          </CardHeader>
          <CardContent>
            <p>Total Albums: {stats.albums}</p>
            <Link to="/albums"><Button>View All Album Functions</Button></Link>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}

