import { PrismaClient } from '@prisma/client';
import { NextFunction, Request, Response } from 'express';

const prisma = new PrismaClient();

const controller = {
  index: async (_req: Request, res: Response, _next: NextFunction) => {
    const allAuthors = await prisma.authors.findMany({
      select: {
        name: true,
        slug: true,
        sort_name_last_first: true,
        images: true,
        _count: {
          select: { books: true }
        }
      }
    });

    res.send(allAuthors);
  },

  show: async function (req: Request, res: Response, next: NextFunction) {
    const author = await prisma.authors.findUnique({
      where: {
        slug: req.params.slug
      },
      include: {
        books: {
          orderBy: {
            release_date: 'desc'
          }
        }
      }
    });

    res.send(author);
  }
};

export default controller;
