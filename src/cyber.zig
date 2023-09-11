// Copyright (c) 2023 Cyber (See LICENSE)

const builtin = @import("builtin");

const parser = @import("parser.zig");
pub const Parser = parser.Parser;
pub const ParseResultView = parser.ResultView;
pub const ParseResult = parser.Result;
pub const Node = parser.Node;
pub const NodeType = parser.NodeType;
pub const NodeId = parser.NodeId;
pub const BinaryExprOp = parser.BinaryExprOp;
pub const Token = parser.Token;
pub const Tokenizer = parser.Tokenizer;
pub const TokenizeState = parser.TokenizeState;
pub const TokenType = parser.TokenType;

const gene_parser = @import("gene_parser.zig");
pub const GeneParser = gene_parser.Parser;
pub const GeneParseResultView = gene_parser.ResultView;
pub const GeneParseResult = gene_parser.Result;
pub const GeneNode = gene_parser.Node;
pub const GeneNodeType = gene_parser.NodeType;
pub const GeneNodeId = gene_parser.NodeId;
pub const GeneBinaryExprOp = gene_parser.BinaryExprOp;
pub const GeneToken = gene_parser.Token;
pub const GeneTokenizer = gene_parser.Tokenizer;
pub const GeneTokenizeState = gene_parser.TokenizeState;
pub const GeneTokenType = gene_parser.TokenType;

pub const sema = @import("sema.zig");
pub const unescapeString = sema.unescapeString;

pub const types = @import("types.zig");
pub const module = @import("module.zig");
pub const ModuleId = module.ModuleId;
pub const Module = module.Module;

const vm_compiler = @import("vm_compiler.zig");
pub const VMcompiler = vm_compiler.VMcompiler;
pub const CompileResultView = vm_compiler.CompileResultView;
pub const CompileConfig = vm_compiler.CompileConfig;
pub const ValidateConfig = vm_compiler.ValidateConfig;
pub const CompileErrorType = vm_compiler.CompileErrorType;

pub const chunk = @import("chunk.zig");
pub const Chunk = chunk.Chunk;
pub const ChunkId = chunk.ChunkId;

pub const register = @import("register.zig");

pub const bindings = @import("builtins/bindings.zig");

pub const hash = @import("hash.zig");
pub const rt = @import("runtime.zig");
pub const fmt = @import("fmt.zig");

pub const codegen = @import("codegen.zig");

pub const value = @import("value.zig");
pub const Value = value.Value;
pub const ValuePair = value.ValuePair;
pub const StaticUstringHeader = value.StaticUstringHeader;

pub const ValueUserTag = value.ValueUserTag;

pub const vm = @import("vm.zig");
pub const EvalConfig = vm.EvalConfig;
pub const getUserVM = vm.getUserVM;
pub const VM = vm.VM;
pub const TraceInfo = vm.TraceInfo;
pub const OpCount = vm.OpCount;
pub const EvalError = vm.EvalError;
pub const buildReturnInfo = vm.buildReturnInfo;
pub const getStackOffset = vm.getStackOffset;
pub const getInstOffset = vm.getInstOffset;
pub const StringType = vm.StringType;

const api = @import("api.zig");
pub const UserVM = api.UserVM;

pub const heap = @import("heap.zig");
pub const HeapObject = heap.HeapObject;
pub const MapInner = heap.MapInner;
pub const Map = heap.Map;
pub const Dir = heap.Dir;
pub const DirIterator = heap.DirIterator;
pub const CyList = heap.List;
pub const Closure = heap.Closure;
pub const Pointer = heap.Pointer;
pub const Astring = heap.Astring;
pub const RawString = heap.RawString;
pub const MaxPoolObjectStringByteLen = heap.MaxPoolObjectAstringByteLen;
pub const MaxPoolObjectRawStringByteLen = heap.MaxPoolObjectRawStringByteLen;

pub const fiber = @import("fiber.zig");
pub const Fiber = fiber.Fiber;

pub const arc = @import("arc.zig");

const map = @import("map.zig");
pub const ValueMap = map.ValueMap;
pub const ValueMapEntry = map.ValueMapEntry;

const list = @import("list.zig");
pub const List = list.List;
pub const ListAligned = list.ListAligned;

pub const debug = @import("debug.zig");
pub const StackTrace = debug.StackTrace;
pub const StackFrame = debug.StackFrame;

pub const string = @import("string.zig");
pub const HeapStringBuilder = string.HeapStringBuilder;
pub const HeapRawStringBuilder = string.HeapRawStringBuilder;
pub const isAstring = string.isAstring;
pub const validateUtf8 = string.validateUtf8;
pub const utf8CharSliceAt = string.utf8CharSliceAt;
pub const indexOfChar = string.indexOfChar;
pub const indexOfAsciiSet = string.indexOfAsciiSet;
pub const toUtf8CharIdx = string.toUtf8CharIdx;
pub const charIndexOfCodepoint = string.charIndexOfCodepoint;
pub const getLineEnd = string.getLineEnd;
pub const prepReplacement = string.prepReplacement;
pub const replaceAtIdxes = string.replaceAtIdxes;
pub const utf8CodeAtNoCheck = string.utf8CodeAtNoCheck;

pub const bytecode = @import("bytecode.zig");
pub const ByteCodeBuffer = bytecode.ByteCodeBuffer;
pub const OpCode = bytecode.OpCode;
pub const InstDatum = bytecode.InstDatum;
pub const Const = bytecode.Const;
pub const DebugSym = bytecode.DebugSym;
pub const getInstLenAt = bytecode.getInstLenAt;

const cyon = @import("cyon.zig");
pub const encodeCyon = cyon.encode;
pub const decodeCyonMap = cyon.decodeMap;
pub const decodeCyon = cyon.decode;
pub const EncodeValueContext = cyon.EncodeValueContext;
pub const EncodeMapContext = cyon.EncodeMapContext;
pub const EncodeListContext = cyon.EncodeListContext;
pub const DecodeMapIR = cyon.DecodeMapIR;
pub const DecodeListIR = cyon.DecodeListIR;
pub const DecodeValueIR = cyon.DecodeValueIR;

/// Sections don't work on macOS arm64 builds but they are needed for the build.
pub const HotSection = if (builtin.os.tag == .macos) "__TEXT,.eval" else ".eval";
pub const Section = if (builtin.os.tag == .macos) "__TEXT,.eval2" else ".eval2";
pub const StdSection = if (builtin.os.tag == .macos) "__TEXT,.eval.std" else ".eval.std";
pub const CompilerSection = if (builtin.os.tag == .macos) "__TEXT,.compiler" else ".compiler";
pub const InitSection = if (builtin.os.tag == .macos) "__TEXT,.cyInit" else ".cyInit";

pub export fn initSection() linksection(InitSection) callconv(.C) void {}
pub export fn compilerSection() linksection(CompilerSection) callconv(.C) void {}
pub export fn stdSection() linksection(StdSection) callconv(.C) void {}
pub export fn section() linksection(Section) callconv(.C) void {}
pub export fn hotSection() linksection(HotSection) callconv(.C) void {}

/// Force the compiler to order linksection first on given function.
/// Use exported c function so release builds don't remove them.
pub fn forceSectionDep(_: *const fn () callconv(.C) void) void {}

pub fn forceSectionDeps() !void {
    forceSectionDep(hotSection);
    forceSectionDep(section);
    forceSectionDep(stdSection);
    forceSectionDep(compilerSection);
    forceSectionDep(initSection);
}

/// Whether to print verbose logs.
pub export var verbose = false;

/// Compile errors are not printed.
pub var silentError = false;

/// Internal messages are not printed.
pub var silentInternal = false;

pub const simd = @import("simd.zig");

pub const isWasm = builtin.cpu.arch.isWasm();
pub const hasJit = !isWasm;
pub const hasStdFiles = !isWasm;

const build_options = @import("build_options");
pub const TraceEnabled = build_options.trace;
pub const TrackGlobalRC = build_options.trackGlobalRC;

const std = @import("std");
pub const NullId = std.math.maxInt(u32);
pub const NullU8 = std.math.maxInt(u8);

/// Document that a id type can contain NullId.
pub fn Nullable(comptime T: type) type {
    return T;
}

pub const NativeObjFuncPtr = *const fn (*UserVM, Value, [*]const Value, u8) Value;
pub const NativeObjFunc2Ptr = *const fn (*UserVM, Value, [*]const Value, u8) ValuePair;
pub const NativeFuncPtr = *const fn (*UserVM, [*]const Value, u8) Value;
pub const NativeErrorFunc = fn (*UserVM, [*]const Value, u8) anyerror!Value;
pub const ModuleLoaderFunc = *const fn (*UserVM, ModuleId) bool;
