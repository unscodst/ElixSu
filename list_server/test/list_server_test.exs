defmodule ListServerTest do
  use ExUnit.Case
  doctest ListServer

  test "add items to a list" do
    {:ok, server} = ListServer.start_link
    ListServer.add(server, :hacksu)
    assert ListServer.get(server) == [:hacksu]
    end
    
    test "remove items to a list" do
        {:ok, server} = ListServer.start_link
        ListServer.add(server, :milk)
        ListServer.add(server, :eggs)
        ListServer.remove(server, :eggs)
        assert ListServer.get(server) == [:milk]   
  end
end
