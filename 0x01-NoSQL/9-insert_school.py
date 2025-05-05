#!/usr/bin/env python3
"""Insert document into MongoDB collection"""


def insert_school(mongo_collection, **kwargs):
    """Inserts a new document into a collection and returns the _id"""
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
