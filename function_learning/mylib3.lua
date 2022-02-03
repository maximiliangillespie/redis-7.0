local function hset(keys, args)
    local hash = keys[1]  -- Get the key name
    local time = redis.call('TIME')[1]  -- Get the current time from the Redis server

    local exists = redis.call('exists', hash)
    if exists==0 then
        table.insert(args, '_created_at')
        table.insert(args, time)
    end

    -- Add the current timestamp to the arguments that the user passed to the function, stored in `args`
    table.insert(args, '_updated_at')  
    table.insert(args, time)

    -- Run HSET with the updated argument list
    return redis.call('HSET', hash, unpack(args))
end

local function touch(keys, args)
    local time = redis.call('TIME')[1]
    return redis.call('HSET', keys[1], '_updated_at', time)
end    

redis.register_function('my_hset', hset)
redis.register_function('my_touch', touch)
