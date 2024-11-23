import React from 'react'
import { HashRouter as Router, Route, Routes, Link } from 'react-router-dom'
import Homepage from './pages/Homepage'
import SongsPage from './pages/SongsPage'
import ArtistsPage from './pages/ArtistsPage'
import AlbumsPage from './pages/AlbumsPage.jsx'
import CollaborationsPage from './pages/CollaborationsPage.jsx'
import AwardsPage from './pages/AwardsPage'
import StreamingPage from './pages/StreamingPage'
import CompaniesPage from './pages/CompaniesPage.jsx'
import LabelsPage from './pages/LabelsPage'
import EventsPage from './pages/EventsPage'
import ProducersPage from './pages/ProducersPage'
import GenresPage from './pages/GenresPage'
import { Button } from "@/components/ui/button"

export default function App() {
  return (
    <Router>
      <div className="min-h-screen bg-background">
        <header className="bg-primary text-primary-foreground p-4">
          <nav className="container mx-auto flex justify-between items-center">
            <Link to="/" className="text-2xl font-bold">SongSelector</Link>
            <div className="space-x-2">
              <Link to="/songs"><Button variant="secondary">Songs</Button></Link>
              <Link to="/artists"><Button variant="secondary">Artists</Button></Link>
              <Link to="/albums"><Button variant="secondary">Albums</Button></Link>
              <Link to="/labels"><Button variant="secondary">Labels</Button></Link>
            </div>
          </nav>
        </header>

        <main className="container mx-auto p-4">
          <Routes>
            <Route path="/" element={<Homepage />} />
            <Route path="/songs" element={<SongsPage />} />
            <Route path="/artists" element={<ArtistsPage />} />
            <Route path="/albums" element={<AlbumsPage />} />
            <Route path="/collaborations" element={<CollaborationsPage />} />
            <Route path="/awards" element={<AwardsPage />} />
            <Route path="/streaming" element={<StreamingPage />} />
            <Route path="/companies" element={<CompaniesPage />} />
            <Route path="/labels" element={<LabelsPage />} />
            <Route path="/events" element={<EventsPage />} />
            <Route path="/producers" element={<ProducersPage />} />
            <Route path="/genres" element={<GenresPage />} />
          </Routes>
        </main>

        <footer className="bg-secondary text-secondary-foreground p-4 mt-8">
          <div className="container mx-auto text-center">
            <p>&copy; 2024 SongSelector by Group 1. All rights reserved.</p>
          </div>
        </footer>
      </div>
    </Router>
  )
}
