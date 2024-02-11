#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
        
    /* -------------------- Create database ------------------------------------------------------------*/
    CREATE DATABASE trades
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;   
    
    \connect trades;
    
    /*------------------------- Create tables ---------------------------------------------------------------*/
    
    CREATE TABLE IF NOT EXISTS quotes (
    id bigint PRIMARY KEY,
    ticker VARCHAR NOT NULL,
    securityid BIGINT NOT NULL,
    tradecode VARCHAR NOT NULL,
    datepost bigint NOT NULL
    );
    
EOSQL