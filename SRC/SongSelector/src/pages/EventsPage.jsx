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

export default function EventsPage() {
  const API_BASE_URL = 'http://localhost:5000'
  const [inputRegion, setInputRegion] = useState('')
  const [displayRegion, setDisplayRegion] = useState('')
  const [events, setEvents] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // Implement API call to backend
    console.log(`Searching live events in region: ${inputRegion}`)
    const response = await fetch(`${API_BASE_URL}/api/live-events?region=${inputRegion}`)
    const data = await response.json()
    setEvents(data)
    // Only update the displayed region when search is clicked
    setDisplayRegion(inputRegion)
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Live Events by Region</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Search for Live Events</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleSearch} className="flex space-x-2">
            <Input
              type="text"
              placeholder="Enter region"
              value={inputRegion}
              onChange={(e) => setInputRegion(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {events.length > 0 && (
        <Card className="mb-6">
          <CardHeader>
            <CardTitle>Live Events in {displayRegion}</CardTitle>
          </CardHeader>

          <CardContent>
            {events.length > 0 && (
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Event</TableHead>
                    <TableHead>Event ID</TableHead>
                    <TableHead>Artist</TableHead>
                    <TableHead>Artist ID</TableHead>
                    <TableHead>Date</TableHead>
                    <TableHead>Location</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {events.map((event) => (
                    <TableRow key={event.EventID}>
                      <TableCell>{event.Event}</TableCell>
                      <TableCell>{event.EventID}</TableCell>
                      <TableCell>{event.Artist}</TableCell>
                      <TableCell>{event.ArtistID}</TableCell>
                      <TableCell>{event.Date}</TableCell>
                      <TableCell>{event.Location}</TableCell>
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