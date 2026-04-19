import { clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

/**
 * A utility function for merging Tailwind CSS classes.
 * @param {...import('clsx').ClassValue} inputs - The class names to merge.
 * @returns {string} The merged class names.
 */
export function cn(...inputs) {
	return twMerge(clsx(inputs));
}
