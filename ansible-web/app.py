import redis

# Connect to Redis
client = redis.Redis(host='localhost', port=6379, decode_responses=True)

# Set and Get a Value
client.set("message", "Hello from Redis!")
print(client.get("message"))  # Output: Hello from Redis!

