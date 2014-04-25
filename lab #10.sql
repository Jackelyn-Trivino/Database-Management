CREATE FUNCTION preReqsFor(courseNum int)
returns TABLE (Number int, Name text) as $$

begin
 RETURN query SELECT num.c, name.c
 FROM Courses c, Prerequisites p
 WHERE c.num = p.preReqNum
     AND p.courseNum = courseNum
end;
$$ LANGUAGE plpgsql

CREATE FUNCTION IsPreReqFor(courseNum int)
returns TABLE (Number int, Name text) as $$

begin
RETURN query SELECT courseNum.p, preReqNum.p
FROM Courses c, Prerequisites p
WHERE c.num = p.preReqNum
    AND p.courseNum = courseNum
end;
$$ LANGUAGE plpgsql
