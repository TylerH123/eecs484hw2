SELECT DISTINCT P.Publisher_ID
FROM Publishers P, Editions E,
( SELECT B.Book_ID
  FROM Books B, 
  ( SELECT A.Author_ID
    FROM Authors A, Books B
    WHERE A.Author_ID = B.Author_ID
    GROUP BY A.Author_ID
    HAVING COUNT(*) = 3
  ) inner
  WHERE B.Author_ID = inner.Author_ID
) inner
WHERE P.Publisher_ID = E.Publisher_ID
  AND E.Book_ID = inner.Book_ID
ORDER BY P.Publisher_ID DESC;