public class Buffer {
  public let pointer: UnsafeMutablePointer<UVBufferType>

  public var size: Int {
    return pointer.memory.len
  }

  public init(_ pointer: UnsafePointer<UVBufferType>, _ size: Int, _ uv_buf_init: UVBufferInitOperation = UVBufferInit) {
    self.pointer = UnsafeMutablePointer.alloc(size)
    self.pointer.memory = uv_buf_init(pointer.memory.base, UInt32(size))
  }

  public init(_ uv_buf_init: UVBufferInitOperation = UVBufferInit) {
    self.pointer = UnsafeMutablePointer.alloc(sizeof(UVBufferType))
    self.pointer.memory = uv_buf_init(UnsafeMutablePointer<CChar>.alloc(sizeof(CChar)), UInt32(sizeof(CChar)))
  }
}
