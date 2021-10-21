import express from 'express';
import { authorController } from '../controllers';

const router = express.Router();

router.get('/', authorController.index);
router.get('/:slug', authorController.show);

export default router;
