class Lista
  include Enumerable
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end
  def insert(new_val)
    new_nodo = Nodo.new(new_val,nil,nil)
    if @head == nil && @tail == nil
      @head = new_nodo
      @tail = new_nodo
    elsif head == tail
      @tail = new_nodo
      @tail.prev = head
      @head.next = tail
    else
      new_nodo.prev = @tail
      @tail.next = new_nodo
      @tail = new_nodo
    end

  end
  def pop_front
    if @head == nil
      return nil
    else
      pop_value = @head.value
      @head = @head.next
      return pop_value
    end
  end
  def each
    nodo_tmp = @head
    until nodo_tmp == nil
      yield nodo_tmp.value
      nodo_tmp = nodo_tmp.next
    end
  end
end
