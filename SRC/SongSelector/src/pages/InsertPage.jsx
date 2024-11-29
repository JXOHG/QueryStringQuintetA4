import React from 'react';
import { InsertDataForm } from '@/components/InsertDataForm';

export default function InsertDataPage() {
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-6">Insert New Data</h1>
      <div className="max-w-md mx-auto">
        <InsertDataForm />
      </div>
    </div>
  );
}

