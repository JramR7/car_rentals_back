# Car Rentals API
API to support the backend for Car Rentals app, created using Ruby on Rails and SQL engine

## Table of contents
* [Introduction](#introduction)
* [Features](#features)
* [Technologies](#technologies)
* [Setup](#setup)

## Introduction
This app will allow the users to register as owners, register multiple vehicles and create trips, every trip creation uses the google api to suggest locations, calculate distances and, by using the distance, generate an associated price. All this information is send via email with a pdf contract.

## Features
This API allows the caller to:

* Register and authenticate with its id document
* Register a new vehicle
* Register a new trip
* See the dashboard with the software information

## Technologies
This project is created with:

* Ruby 2.6.3
* Rails 5.2.3

## Setup
* Before running any command you need to create a database.yml in the config folder to specify how are you using the database.
* To setup this project you need to have installed ruby2.6.3, and run the command 'bundle install'.
* Run the migrations with the command "rails db:migrate"
* Seed the database with the command "rails db:seed"
* To start the rails server locally, run the command "rails server -p 3001"
