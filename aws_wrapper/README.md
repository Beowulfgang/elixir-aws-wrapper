# AwsWrapper

**TODO: Add description**

## Installation


```# List buckets
{:ok, bucket_names} = AwsS3Wrapper.list_buckets()
IO.inspect(bucket_names)

# List objects in a bucket
{:ok, object_keys} = AwsS3Wrapper.list_objects("my-bucket")
IO.inspect(object_keys)

# Upload a file to S3
{:ok, etag} = AwsS3Wrapper.upload_file("my-bucket", "path/to/local/file.txt", "path/in/s3/file.txt")
IO.inspect(etag)
```

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `aws_wrapper` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:aws_wrapper, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/aws_wrapper>.

