defmodule AwsS3Wrapper do
  require Logger
  import ExAws.S3

  alias ExAws.S3.Upload

  def list_buckets do
    list_buckets()
    |> ExAws.request()
    |> handle_response(&handle_list_buckets_response/1)
  end

  def list_objects(bucket_name) do
    list_objects(bucket_name)
    |> ExAws.request()
    |> handle_response(&handle_list_objects_response/1)
  end

  def upload_file(bucket_name, local_path, remote_key) do
    local_path
    |> File.stream!([], 1_000_000)
    |> Upload.stream(remote_key)
    |> upload(bucket_name)
    |> ExAws.request()
    |> handle_response(&handle_upload_response/1)
  end

  defp handle_response({:ok, response}, handler) do
    handler.(response)
  end

  defp handle_response({:error, error}, _handler) do
    Logger.error("Error: #{inspect(error)}")
    {:error, error}
  end

  defp handle_list_buckets_response(%{"Buckets" => buckets}) do
    {:ok, Enum.map(buckets, & &1["Name"])}
  end

  defp handle_list_objects_response(%{"Contents" => objects}) do
    {:ok, Enum.map(objects, & &1["Key"])}
  end

  defp handle_upload_response(%{"ETag" => etag}) do
    {:ok, etag}
  end
end

