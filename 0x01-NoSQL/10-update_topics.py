#!/usr/bin/env python3
"""Update school topics"""


def update_topics(mongo_collection, name, topics):
    """Updates the topics of a school document by name"""
    mongo_collection.update_many(
        {"name": name},
        {"$set": {"topics": topics}}
    )
