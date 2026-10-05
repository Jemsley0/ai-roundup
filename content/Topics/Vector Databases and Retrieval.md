---
type: topic
tags: [topic, vector-databases, retrieval, vector-databases-and-retrieval]
updated: 2026-10-05
living: true
---

# Vector Databases and Retrieval

What a vector database actually is, how it differs from a graph, where each one fails, and the market consolidation that argues against buying a standalone one by default.

## Where this stands

A vector database finds things that are like a query, while a graph database finds things connected to it by a named relationship. They are not substitutes, and their failures are asymmetric: vector search silently returns confident, plausible-wrong neighbours, while a graph query that matches nothing returns nothing.

The market is fragmenting by scale and workload, not collapsing. Postgres with pgvector handles a large share of workloads under roughly 50M vectors, and Snowflake and Databricks spent about \$1.25B in 2025 acquiring Postgres-first companies. The newest debate is whether a vector database should be a standalone product at all. turbopuffer's version 3 treats approximate nearest-neighbour search as one secondary index and keys documents by an internal ID, which avoids write and storage amplification, though its performance is unmeasured. AWS sells both answers under similar names: Bedrock Knowledge Bases where you provision the store, and Managed Knowledge Base where AWS owns the datastore, embedding model and reranker. Managed suits a prose corpus nobody will tune. It is wrong for anything governed or anything whose retrieval quality someone must defend.

This week's evidence points toward cheaper, simpler retrieval. AWS says S3 Vectors metadata pre-filtering returns up to 5x more matching vectors for selective filters, on by default for new indexes, though the 5x is AWS's own figure. SkillSeek found plain BM25 keyword retrieval matched a model-mediated loop when an agent selects among 230,000 skills, at roughly half the cost per trial. JetBrains argues 1-bit vectors and syntax-tree-aware chunks suffice for code search, with no recall numbers given. Perplexity's Photon cut internal p99 latency from about 800ms to 65ms and priced the relevance it gave up, which is rare.

For a data platform the split stays clean: retrieve prose by similarity, retrieve structure by traversal, and do not ask either to do the other's job.

## Open questions

- Nobody has a good answer for temporal retrieval at the vector layer. Graphiti solves it with bi-temporal edges, and no flat store matches that.
- The pgvectorscale figures (471 queries per second against Qdrant's 41 at 99 percent recall on 50M vectors) are vendor-flavoured and directional only.
- Nobody addresses re-embedding cost seriously. A change of embedding model means rebuilding everything.
- No same-corpus comparison exists between Bedrock Managed Knowledge Base's agentic retriever and its standard hybrid path, which costs 5x less per call.
- Nobody outside AWS has published recall or latency for S3 Vectors against OpenSearch Serverless, or measured the pre-filtering gain on real filtered workloads.
- Does the JetBrains 1-bit, syntax-aware approach hold recall on real code-search tasks?
- Does turbopuffer's single-secondary-index design perform in production at scale?
- Does Photon's 0.24-point relevance cost hold outside Perplexity's own workload mix?

## 2026-10-05

![[2026-10-05#^jetbrains-1bit]]

![[2026-10-05#^rn-weaviate-1399]]

![[2026-10-05#^aws-context-vs-managed-kb]]

Source note: [[2026-10-05]]

## 2026-10-02

![[2026-10-02#^s3-vectors-prefilter]]

![[2026-10-02#^turbopuffer-rip-vector-db]]

![[2026-10-02#^skillseek-bm25]]

![[2026-10-02#^rn-s3-vectors-prefilter]]

![[2026-10-02#^rn-weaviate-140-rc2]]

![[2026-10-02#^rn-weaviate-1398]]

![[2026-10-02#^rn-pgvector-087]]

![[2026-10-02#^radar-s3-vectors-prefilter]]

Source note: [[2026-10-02]]

## 2026-09-29

![[2026-09-29#^perplexity-photon]]

![[2026-09-29#^dbx-ai-search-lakebase]]

![[2026-09-29#^milvus-2-6-25]]

![[2026-09-29#^weaviate-1-39-7]]

Source note: [[2026-09-29]]

## 2026-09-18

**AWS now sells the managed and the self-managed answer to this page's central question under near-identical names, and the distinction is an API field.** Bedrock Knowledge Bases, the older feature, is `knowledgeBaseConfiguration.type = VECTOR`: you provision the vector store and retain control of index schema, embedding dimensions, storage configuration and parsing logic while Bedrock orchestrates queries against it. Bedrock Managed Knowledge Base, generally available since Jun 17, 2026, is `type = MANAGED`: AWS owns the datastore, the embedding model and the reranker, nothing is provisioned, and scaling and rate limits become AWS's problem. The self-managed backend list in 2026 is broad, covering Amazon OpenSearch Serverless and managed clusters, Aurora PostgreSQL with pgvector, Amazon S3 Vectors, Neptune Analytics, Pinecone, MongoDB Atlas and Redis Enterprise Cloud. On the managed side, retrieval goes past hybrid search: an agentic retriever plans queries, connects concepts across documents and reranks results, and ingestion handles text, video, audio and image content across seven native connectors. The trade this page keeps returning to is the one AWS is asking you to make. A managed store cannot be inspected, so a result that scored 0.83 stays unexplainable, and a managed embedding model cannot be pinned, which is the re-embedding-cost question standing open above. ([Managed Knowledge Base launch](https://aws.amazon.com/blogs/aws/introducing-amazon-bedrock-managed-knowledge-base-for-faster-more-accurate-enterprise-ai-applications/))

**AWS published per-use-case vector-store guidance on Sep 17, narrowing its first-party recommendation to three engines.** OpenSearch Serverless for real-time product search, on low-millisecond latency and hybrid search. Amazon S3 Vectors for deep-research agents, where AWS claims up to 90 percent cost reduction with elastic scaling. Aurora PostgreSQL for customer chatbots, on sub-100ms latency with flexible indexing and integration with relational data. AWS frames the three as complementary tiers in one architecture rather than a one-way choice, which is a fair reading of the latency and cost differences and consistent with this page's fragmentation-by-workload conclusion. The Aurora recommendation is the notable one: it puts AWS's own guidance behind the pgvector-in-Postgres pattern for the most common chatbot workload, which is the same consolidation Snowflake and Databricks bought into in 2025. ([Selecting a vector store](https://aws.amazon.com/blogs/machine-learning/selecting-a-vector-store-for-amazon-bedrock-knowledge-bases/))

**Managed retrieval pricing is now legible, and the agentic path costs 5x the standard one.** Index storage is \$5.00 per GB of raw data per month, charged on raw data rather than the resulting index, which makes it predictable directly from corpus size. Multimodal document parsing, embeddings generation and the managed reranker are included at no charge. The standard Retrieve API, hybrid semantic and keyword search, is \$1.00 per 1,000 calls. Agentic retrieval is \$4.00 per 1,000 Agentic Retrieve calls plus \$1.00 per 1,000 underlying Retrieve calls, so \$5.00 against \$1.00 for the same 1,000 queries. Bringing your own embedding or reranking model adds the provider's rates on top. The read: ignore agentic retrieval until a same-corpus quality comparison exists, because the entire case for the premium is retrieval quality and the number that would justify it has not been published by anyone. ([Bedrock pricing](https://aws.amazon.com/bedrock/pricing/))

**Ingestion got three changes on Sep 4, all reducing setup friction rather than improving retrieval.** ServiceNow became a native connector, crawling knowledge articles and service catalog items including file attachments, scoped by system-identifier inclusion lists, with crawling, metadata extraction and incremental sync handled. User-managed setup arrived for SharePoint, OneDrive and Confluence using three-legged OAuth, so a user signs in with their own third-party credentials rather than generating two-legged credentials on the third-party side, which previously needed administrator-level access; AWS is explicit that this complements rather than replaces service-account authentication, which stays the enterprise option and is the right one for a production knowledge base, since the user-managed path binds ingestion to one person's credentials. Automatic sync scheduling arrived for all native connectors on daily, weekly or monthly cadences, retiring manual triggers and custom schedulers. ([ServiceNow connector](https://aws.amazon.com/about-aws/whats-new/2026/09/amazon-bedrock-managed-knowledge-base-servicenow-native-data-source-connector/), [user-managed setup](https://aws.amazon.com/about-aws/whats-new/2026/09/amazon-bedrock-managed-knowledge-base-user-managed-setup-sharepoint-onedrive-confluence/), [automatic sync scheduling](https://aws.amazon.com/about-aws/whats-new/2026/09/amazon-bedrock-managed-knowledge-base-automatic-sync-scheduling-data-source-connectors/))

Source note: [[2026-09-18]]

## 2026-09-10

**Graphiti is the counterexample to flat vector stores for agent memory, and it earned its own writeup.** Apache-2.0, built by Zep, roughly v0.17 with about 30.8k GitHub stars. The problem it solves: agent memory built on a vector store can only answer "what is most similar to this?" and has no representation for a fact that *used to* be true. When new information contradicts old, you either overwrite the chunk and lose history, or keep both, at which point retrieval returns two contradictory passages ranked by cosine distance with no principled way to prefer the current one. That failure gets worse the longer an agent runs, which is exactly when memory is supposed to start paying off.

Graphiti makes time a first-class dimension. You feed it **episodes**, raw conversational turns, events, and observations, which stay stored as ground-truth provenance for everything derived from them. An LLM extracts **entities** as nodes with evolving summaries and **relationships** as edge triplets. Every edge carries a **validity window**, and the model is **bi-temporal**, tracking *valid time*, when the fact was actually true in the world, and *system time*, when Graphiti learned it or invalidated it. That split is the load-bearing piece: learning today that something was true last March is a genuinely different event from it becoming true today, and most memory systems cannot tell those apart, which makes retroactive corrections either impossible or silently wrong. When a fact is superseded, Graphiti marks it invalid rather than deleting it, and every node and edge keeps a pointer back to the episode that produced it, so you can audit why the graph believes anything. Retrieval is hybrid, combining semantic embeddings, BM25, and graph traversal, and makes **no LLM calls at query time**, which is the choice that buys sub-second latency. Backends are Neo4j 5.26+, FalkorDB 1.1.2+, and Amazon Neptune, which needs OpenSearch Serverless for full-text.

The contrast with GraphRAG is workload rather than quality: GraphRAG batch-processes static document corpora, uses LLM judgment to reconcile conflicts, and takes seconds to minutes, while Graphiti does continuous incremental updates, explicit temporal invalidation instead of LLM-driven judgment, and sub-second queries over millions of small mostly-cold graphs. One is retrieval over a corpus; the other is a running memory for a long-lived agent.

**The caveat worth holding onto given how this gets marketed:** the extraction step is an LLM reading your episodes and deciding what the entities and relationships are. That is a modeling decision made probabilistically at ingest, and a bad extraction becomes a confidently wrong edge that traversal will follow without hesitation. It moves the failure mode from silent to structural, which is more auditable but not free. Fixing a mis-extracted relationship after the fact is closer to a data-repair job than a re-index. ([GitHub](https://github.com/getzep/graphiti), [Zep](https://www.getzep.com/ai-agents/temporal-knowledge-graph/))

Source note: [[2026-09-10]]

## 2026-09-09

This is the conceptual explainer that anchors the topic. Requested rather than driven by a dated announcement.

**What a vector database actually is.** It stores embeddings and answers one question well: what is closest to this? An embedding model turns a chunk of text, an image, or an audio clip into a fixed-length array of floats, typically 384 to 3,072 dimensions, positioned so semantically similar inputs land near each other. The database indexes those arrays and, given a query vector, returns the k nearest by a distance metric, usually cosine similarity, sometimes dot product or Euclidean. That is the whole primitive. Metadata filters, namespaces, and hybrid keyword scoring are scaffolding around nearest-neighbour lookup in a metric space. The important consequence is that meaning becomes geometry, so paraphrase robustness comes free: a query for "how do I refresh a model from scratch" retrieves a document titled "full-refresh procedure" without anyone writing a synonym rule. Nothing in the database knows what a model or a refresh *is*. It only knows two points are 0.11 apart. No schema, no ontology, no curation, in exchange for no semantics you can inspect.

**The index is the product, not the storage.** Exact nearest-neighbour search over millions of vectors means comparing the query against every stored vector, too slow for interactive use, so every production vector database is really an approximate nearest neighbour index trading a small tunable amount of recall for orders-of-magnitude lower latency. Two index families dominate. **HNSW** builds a hierarchical proximity graph: each vector is a node linked to approximate neighbours, upper layers hold sparse long-range highway edges, lower layers dense local ones, and a query enters at the top, greedily traverses toward the target, then descends to refine. **IVF** instead partitions the space into cells with k-means and probes only the cells nearest the query. HNSW is the default for most production workloads, with high recall, active-write handling, and predictable scaling, while IVF earns its place on very large mostly-static datasets where memory footprint or index build time dominates. Quantization, product or binary, is the third lever, cutting memory at some accuracy cost. Note that **HNSW is itself a graph**, a proximity graph over anonymous points traversed to find geometric neighbours, which is a genuinely different thing from a knowledge graph whose edges carry meaning you authored. Keep the two senses of "graph" apart, because the vendor marketing does not. ([HNSW vs IVF tradeoffs](https://matthewpalma.dev/blog/vector-search-indexing-hnsw-ivf-recall-latency-tradeoffs))

**Why it matters for AI.** Retrieval-augmented generation is the load-bearing use case: a model's context window is finite and its training data frozen, so the standard pattern chunks a corpus, embeds the chunks, and at query time retrieves the top-k nearest into the prompt. Vector search is what makes that work on a question phrased in the user's words rather than the document's. The same primitive underpins semantic search over an internal wiki, deduplication and clustering of near-identical records, recommendation, and anomaly detection by distance from a centroid. The newer and less settled use case is agent memory: an agent running for weeks needs to recall session three during session forty, and the naive implementation embeds every past turn and retrieves by similarity to the current turn. That works acceptably for "have I seen something like this before" and poorly for almost everything else.

**Vector versus graph, on five axes.** *The query primitive*: vector search takes a point and returns its geometric neighbours, approximately, ranked by distance, with one knob (k) and one answer shape. Graph queries match a pattern, in Cypher a subgraph shape like `(model)-[:DEPENDS_ON]->(:Source)<-[:OWNED_BY]-(team)`, and traverse typed edges deterministically, expressing arbitrary structure that either matches or does not. *What you must decide in advance*: a vector store needs no schema, so time-to-first-result is hours, which is why vector RAG became the default. A graph demands you first decide what your entities and relationships *are*, and that modeling work is the expensive part. The graph's cost is upfront and human; the vector store's cost is deferred and shows up as retrieval quality you cannot debug. *Multi-hop reasoning* is the sharpest split: ask "which dbt models would break if this upstream source changes schema" and a graph traverses dependency edges for a complete correct answer, while a vector store retrieves chunks that *sound like* they concern that source and has no way to follow a chain, because there are no edges, only distances. Microsoft's GraphRAG work found graph retrieval beat vector RAG on answer comprehensiveness 72 to 83 percent of the time, HippoRAG improved multi-hop recall by up to 20 percent, and graph methods ran roughly 3x better on aggregation queries specifically because traversal can count edges, filter on node properties, and aggregate across relationships. Counting and aggregating are things a vector index structurally cannot do. *Explainability*: a graph result comes with a path, and the path *is* the justification, auditable. A vector result comes with a float: you can see a chunk scored 0.83 and cannot see why, or whether the embedding model conflated two concepts your domain treats as distinct. For anything governed, regulated, or subject to incident review, that matters more than recall. *Time and contradiction*: a vector store either overwrites the old chunk or keeps both, in which case retrieval returns two contradictory passages ranked by similarity with no way to prefer the current one. Temporal knowledge graphs handle this natively, and a flat vector store cannot even express "what was true as of last March." ([GraphRAG vs vector RAG](https://www.meilisearch.com/blog/graph-rag-vs-vector-rag), [when vector search fails](https://tianpan.co/blog/2026-04-20-knowledge-graphs-vs-vector-search-retrieval))

**Where each one fails.** Vector search **fails silently**: it always returns k results ranked by distance, so a query it cannot answer produces confident, plausible, wrong neighbours, and the generation step downstream will happily write prose on top of them. Entity disambiguation is the classic case, where two people, tables, or products with similar names sit close together in embedding space and nothing flags the collision. Graph queries **fail loudly**: a pattern that matches nothing returns nothing, which is annoying and honest. Graphs have a real opposite weakness: they underperform on simple lookups. One evaluation had basic vector RAG at 60.92 percent accuracy on simple fact retrieval against 49.29 to 60.14 percent for graph methods, with the paper concluding graph structure introduces "redundant or noisy information for simpler queries." If most of your traffic is "find me the doc that explains X," a graph is overhead and a liability. Graphs also cannot do paraphrase matching on their own, and a mis-modeled relationship produces confidently incorrect traversals that need a schema migration rather than a re-index to fix.

**The hybrid convergence.** Nearly every serious system now layers both, and the vendors converged from opposite directions. Snowflake's Cortex Search is a hybrid engine combining vector embeddings, keyword search, and semantic reranking behind one interface, with a native `VECTOR` type and a `VECTOR INDEXES` clause that will index your own embeddings as-is if you would rather bring them; Snowflake reports the hybrid approach beating pure vector search by more than 12 percent on retrieval, a vendor number whose direction matches the independent GraphRAG findings. From the other side, Neo4j ships vector indexes and built-in embedding procedures for OpenAI, Bedrock, and Vertex, so you can retrieve by meaning then traverse structure for the connected context that explains the hit. Graphiti blends semantic embeddings, BM25, and graph traversal, notably without any LLM call at retrieval time. On market shape: the category sits around \$3.2 to 3.7B growing 23 to 27 percent annually, Qdrant raised a \$50M Series B in March 2026 and crossed 250M downloads, Pinecone has raised \$138M, and Zilliz \$113M. ([Cortex Search](https://www.snowflake.com/en/blog/cortex-search-ai-hybrid-search/), [state of vector DBs](https://www.actian.com/blog/developer/state-of-vector-databases-q2-2026/))

**The practical read for a data-platform context.** The entities are already modeled. dbt models, sources, tests, orchestrator assets, jobs, and schedules form a real typed dependency graph that exists whether or not anyone loads it into a graph database, and lineage, blast-radius, and ownership questions are traversal questions that vector search answers badly. Documentation, KB docs, chat threads, and runbook prose are unstructured and paraphrase-heavy, which is vector search's home ground.

Source note: [[2026-09-09]]

## Also mentioned

- **[[2026-09-14]]**: nothing dated in the vector-database layer that window. LanceDB, Turbopuffer, and pgvector were checked specifically and yielded only undated comparison content.
- **[[2026-09-03]]**: Bedrock Managed Knowledge Base was covered as cutting the hand-rolled retrieval infrastructure tax for enterprise RAG. Corrected in [[2026-09-18]]: it reached general availability on Jun 17, 2026, not in that window. Retrieval was also bifurcating by query complexity rather than converging on one pipeline, with Adaptive RAG (a classifier routing each query to a cheap or expensive pipeline), Anthropic's Contextual Retrieval (prepending explanatory context before embedding to fix chunking accuracy loss), and Microsoft's GraphRAG (traversing a knowledge graph instead of pure similarity) as complementary rather than competing approaches.
- **[[2026-09-16]]**: Databricks renamed Vector Search to AI Search and shipped Lakebase Search, a hybrid vector and full-text retrieval engine built into Postgres using 32x compression for over a billion vector indexes at low cost.

## On the radar

- `🟡 ASSESS` **Graphiti / temporal knowledge graphs**. [[2026-09-11]]
- `🟡 ASSESS` **Bedrock Managed Knowledge Base agentic retrieval**, a managed retriever that plans queries and reranks across documents at 5x the per-call cost of standard hybrid search, with no published same-corpus quality comparison. [[2026-09-18]]
- `🟡 ASSESS` **S3 Vectors metadata pre-filtering**, filters evaluated before similarity search, default for new indexes; the 5x figure is AWS-reported. [[2026-10-02]]
- `🔵 TRIAL` **BM25-first skill and tool retrieval (SkillSeek)**, deterministic keyword retrieval as the default selector for a large skill or tool registry; single paper. [[2026-10-02]]

## Related

[[Topics/Agent Memory and Context Engineering|Agent Memory and Context Engineering]] · [[Topics/Semantic Layer and Knowledge Graphs|Semantic Layer and Knowledge Graphs]] · [[Topics/Data Platform and Ingestion|Data Platform and Ingestion]]
