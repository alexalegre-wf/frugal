package com.workiva.frugal;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class FContextTest {

    @Test
    public void testGenerateCorrelationId() {
        FContext ctx = new FContext();
        assertNotEquals("", ctx.getCorrelationId());
    }

    @Test
    public void testCorrelationId() {
        String correlationId = "abc";
        FContext ctx = new FContext(correlationId);
        assertEquals(correlationId, ctx.getCorrelationId());
    }

    @Test
    public void testOpId() {
        FContext ctx1 = new FContext();
        FContext ctx2 = new FContext();
        FContext ctx3 = new FContext();
        assertEquals(1, ctx2.getOpId() - ctx1.getOpId());
        assertEquals(2, ctx3.getOpId() - ctx1.getOpId());
    }

    @Test
    public void testRequestHeader() {
        FContext ctx = new FContext();
        ctx.addRequestHeader("foo", "bar");
        assertEquals("bar", ctx.getRequestHeader("foo"));
        assertNull(ctx.getRequestHeader("blah"));
    }

    @Test
    public void testResponseHeader() {
        FContext ctx = new FContext();
        ctx.addResponseHeader("foo", "bar");
        assertEquals("bar", ctx.getResponseHeader("foo"));
        assertNull(ctx.getResponseHeader("blah"));
    }

}