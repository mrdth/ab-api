import express from 'express';
import { bookController } from '../controllers';

const router = express.Router();

router.get('/', bookController.index);
router.get('/:slug', bookController.show);

export default router;
