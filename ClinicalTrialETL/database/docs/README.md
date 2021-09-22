# Database

## About

This database was built to serve the data needs of the Human Physiology Lab (P.I.: Dr. William Schrage) at the 
University of Wisconsin-Madison.
This is where study data is loaded after data extraction and transformations (i.e., the "L" in "ETL").
The decision to use SQL Server as the data repository is as follows:
* the School of Education at UW-Madison has built infrastructure, including a HIPAA-compliant SQL Server environment and 
a dedicated DBA, relieving the workload on the lab.
* the creation of a HIPAA compliant data warehouse or data lake falls outside of my expertise (this is a one-man show). 
* cost: it's free for our lab!.
* the amount of data is relatively small, not streaming, and can easily be handled by SQL Server.

## Built With
* SQL (SQL Server 17+)
    * The only necessary tool to build the database from scatch.
* Python (3.7+)
    * Used for integration with overall ETL process.

## Getting Started

### Prerequisites

### Installation

## Usage

## Roadmap
Short-term: 
* ???

Long-term:
* HIPAA compliant data warehouse

## Contributing
This database was built specifically for the Human Physiology Lab (P.I.: Dr. William Schrage) at the 
University of Wisconsin-Madison, so the use of this repo is limited in scope. However, I hope it may help someone who 
is self-teaching and looking to implement a similar process at their work/lab/home/etc.

## License

## Creator
Aaron Ward

## Maintainer(s)
Aaron Ward

## Contact
Aaron Ward