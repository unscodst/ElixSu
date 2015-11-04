defmodule ListServer do
    use GenServer
    
    #Client API
    def start_link do
        GenServer.start_link(ListServer, [])
    end
    
    def get(server) do
        GenServer.call(server, :get)
    end
    
    def add(server, item) do
        GenServer.call(server, {:add, item})
    end
    
    def remove(server, item) do
        GenServer.call(server, {:remove, item})
    end
    
    #GenSever API
    def handle_call(:get, _from, list) do
        {:reply, list, list}
    end
    
    def handle_call({:add, item}, _from, list) do
        {:reply, item, list ++ [item]}
    end
    
    def handle_call({:remove, item}, _from, list) do
        {:reply, item, List.delete(list, item)}
    end

end
