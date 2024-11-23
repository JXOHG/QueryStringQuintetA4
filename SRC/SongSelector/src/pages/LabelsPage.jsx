import React, { useState, useEffect } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"

export default function LabelsPage() {
  const [topLabels, setTopLabels] = useState([])

  useEffect(() => {
    // TODO: Implement API call to backend
    const fetchTopLabels = async () => {
      console.log('Fetching top 3 most active labels')
      // const response = await fetch('/api/top-labels')
      // const data = await response.json()
      // setTopLabels(data)
    }
    fetchTopLabels()
  }, [])

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Top 3 Most Active Labels</h1>
      <Card>
        <CardHeader>
          <CardTitle>Most Active Labels by Number of Active Artists</CardTitle>
        </CardHeader>
        <CardContent>
          {topLabels.length > 0 ? (
            <ol>
              {topLabels.map((label, index) => (
                <li key={index}>{label.name} - {label.activeArtists} active artists</li>
              ))}
            </ol>
          ) : (
            <p>Loading top labels...</p>
          )}
        </CardContent>
      </Card>
    </div>
  )
}

