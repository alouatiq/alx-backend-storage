#!/usr/bin/env python3
"""Extended log stats with top IPs"""


from pymongo import MongoClient

if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    collection = client.logs.nginx

    total_logs = collection.count_documents({})
    print(f"{total_logs} logs")

    print("Methods:")
    for method in ["GET", "POST", "PUT", "PATCH", "DELETE"]:
        count = collection.count_documents({"method": method})
        print(f"\tmethod {method}: {count}")

    status_count = collection.count_documents({"method": "GET", "path": "/status"})
    print(f"{status_count} status check")

    print("IPs:")
    pipeline = [
        {"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}},
        {"$limit": 10}
    ]
    for entry in collection.aggregate(pipeline):
        print(f"\t{entry['_id']}: {entry['count']}")
