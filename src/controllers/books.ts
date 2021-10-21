import { PrismaClient } from '@prisma/client';
import { NextFunction, Request, Response } from 'express';

const prisma = new PrismaClient();

const controller = {
  index: async (_req: Request, res: Response, _next: NextFunction) => {
    const allBooks = await prisma.books.findMany({
      select: {
        title: true,
        slug: true,
        images: true
      }
    });

    res.send(allBooks);
  },

  show: async function (req: Request, res: Response, next: NextFunction) {
    const book = await prisma.books.findUnique({
      where: {
        slug: req.params.slug
      }
    });

    res.send(book);
  }
};

export default controller;
