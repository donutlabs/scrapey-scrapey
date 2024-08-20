# WordPress Media Library Image Downloader

This PowerShell script allows you to download all images from a WordPress website's media library using the WordPress REST API. It handles pagination automatically, ensuring that all images, even from large libraries, are retrieved and saved locally.

## Features

- **Fetches Media Items via REST API**: Utilizes WordPress's built-in REST API to retrieve URLs for all media items.
- **Handles Pagination**: Automatically iterates through all pages of media items, ensuring complete coverage of the media library.
- **Bulk Download**: Downloads each image and saves it to a specified local directory.
- **Customizable Save Location**: You can specify where to save the downloaded images on your local machine.

## Requirements

- **PowerShell**: Ensure you have PowerShell installed on your machine. This script works on both Windows and Linux with PowerShell Core.

