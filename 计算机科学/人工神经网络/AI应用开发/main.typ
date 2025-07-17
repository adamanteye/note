#import "../../../note_zh.typ": *
#show: conf.with(
  title: "AI应用开发",
  author: "adamanteye",
)
#show: rest => columns(2, rest)

= AI Agent
MCP (Model Context Protocol)赋予了大模型调用系统工具,外部API,本地数据的能力.

传统的Function Calling将大模型可调用的工具放在system prompt里面,随user prompt发给大模型,大模型的输出被解析为具体的调用.

而在MCP的框架里,工具和资源由MCP server管理,MCP client (AI agent)与大模型以及MCP server交互.因此,MCP赋予了大模型协调工具,实现流程自动化的能力.
#figure(image("./1.jpg", width: 100%), caption: "MCP流程")

在基于MCP构建应用的过程中,有以下难题需要解决:
- 网页浏览
- 沙箱
- 用户记忆
- 数据库
= RAG
检索增强生成,即RAG (Retrieval-Augmented Generation),是一种使用来自私有或专有数据源的信息来补充文本生成的技术.

Embedding,即将限制长度的输入转为高维向量的技术,以及向量数据库,是实现文档入库以及查询的核心.
= 模型
== Embedding
