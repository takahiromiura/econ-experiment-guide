-- 引用と文献の一覧だけを英語の表記で作る。
-- lang: ja のまま citeproc を通すと「Fehr と Schmidt (1999年)」の形になる。
-- citeproc は lang を見て表記を決めるので、その間だけ lang を en-US にして、終わったら戻す。
-- _quarto.yml で citeproc: false にして、ここで 1 回だけ通す。
function Pandoc(doc)
  local lang = doc.meta.lang
  doc.meta.lang = pandoc.MetaString("en-US")
  doc = pandoc.utils.citeproc(doc)
  doc.meta.lang = lang
  return doc
end
