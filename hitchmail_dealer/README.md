# Hitchmail Dealer App

This Flutter app is designed for dealers to scan parcels, manage business hours, view parcel history, handle payments via Stripe Connect, and verify parcel pickup with PIN codes.

## Features

- Onboarding for dealers (name, address, government ID upload)
- OCR scanning of parcel reference numbers
- Scanning in/out parcels
- Business hours management
- Parcel history with monthly reset
- Stripe Connect payment integration
- PIN input for parcel pickup verification
- Twilio SMS integration for PIN notifications

## Setup

- Flutter SDK required
- Configure Stripe Connect keys
- Configure Twilio API keys
- OCR package integration (Google MLKit recommended)

## Development

- Modular architecture with separate screens for each feature
- OCR sensitivity adjustable via config
- Payment logic triggers on PIN verification

## Next Steps

- Implement onboarding flow reuse
- Integrate OCR scanning
- Build UI for scanning, business hours, history, payment, and PIN input
- Integrate Twilio and Stripe Connect APIs
