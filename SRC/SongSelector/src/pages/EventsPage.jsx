import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function EventsPage() {
  const [region, setRegion] = useState('')
  const [events, setEvents] = useState([])

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Searching live events in region: ${region}`)
    // const response = await fetch(`/api/live-events?region=${region}`)
    // const data = await response.json()
    // setEvents(data)
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
              value={region}
              onChange={(e) => setRegion(e.target.value)}
              className="flex-grow"
            />
            <Button type="submit">Search</Button>
          </form>
        </CardContent>
      </Card>

      {events.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle>Live Events in {region}</CardTitle>
          </CardHeader>
          <CardContent>
            <ul>
              {events.map((event, index) => (
                <li key={index}>{event.name} - {event.date} at {event.venue}</li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

