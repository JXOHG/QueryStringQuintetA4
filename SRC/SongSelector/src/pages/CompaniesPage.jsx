import React, { useState } from 'react'
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export default function CompaniesPage() {
  const [region, setRegion] = useState('')
  const [netWorth, setNetWorth] = useState(null)

  const handleSearch = async (e) => {
    e.preventDefault()
    // TODO: Implement API call to backend
    console.log(`Calculating net worth for region: ${region}`)
    // const response = await fetch(`/api/companies-net-worth?region=${region}`)
    // const data = await response.json()
    // setNetWorth(data.netWorth)
  }

  return (
    <div>
      <h1 className="text-3xl font-bold mb-6">Companies Net Worth by Region</h1>
      <Card className="mb-6">
        <CardHeader>
          <CardTitle>Calculate Net Worth by Region</CardTitle>
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
            <Button type="submit">Calculate</Button>
          </form>
        </CardContent>
      </Card>

      {netWorth !== null && (
        <Card>
          <CardHeader>
            <CardTitle>Total Net Worth</CardTitle>
          </CardHeader>
          <CardContent>
            <p>The total net worth of companies in {region} is ${netWorth.toLocaleString()}</p>
          </CardContent>
        </Card>
      )}
    </div>
  )
}

